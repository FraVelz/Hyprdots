#!/usr/bin/env python3

"""
Script para actualizar las configuraciones de Hyprdots en Arch Linux.
Realiza copias de seguridad previas y permite simular el proceso con
--dry-run antes de modificar el entorno del usuario.

Mejoras:
- Validación de directorios y archivos
- Mejor manejo de errores
- Verificación de herramientas necesarias
- Mensajes de progreso mejorados
- Soporte para la nueva estructura modular
"""

import argparse
import datetime
import glob
import json
import os
import shutil
import subprocess
import sys
import time
from pathlib import Path


def parse_args():
    """Parsea los argumentos de línea de comandos."""
    parser = argparse.ArgumentParser(
        description=(
            "Actualiza las configuraciones de Hyprdots aplicándolas en el usuario actual. "
            "Crea copias de seguridad previas y permite un modo dry-run para simular el proceso."
        ),
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Ejemplos:
  %(prog)s                    # Actualiza configuraciones normalmente
  %(prog)s --dry-run          # Simula la actualización sin hacer cambios
  %(prog)s --no-reload        # Actualiza sin recargar Hyprland
  %(prog)s --backup-dir ~/backups  # Usa directorio personalizado para backups
        """
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Muestra las acciones sin modificar archivos ni ejecutar comandos."
    )
    parser.add_argument(
        "--backup-dir",
        default=os.path.expanduser("~/Hyprdots_backups"),
        type=str,
        help=(
            "Ruta base donde se guardarán las copias de seguridad antes de sobrescribir archivos. "
            "Se creará un subdirectorio por ejecución."
        )
    )
    parser.add_argument(
        "--no-reload",
        action="store_true",
        help="No recarga Hyprland después de actualizar las configuraciones."
    )
    parser.add_argument(
        "--skip-backup",
        action="store_true",
        help="Omite la creación de copias de seguridad (no recomendado)."
    )
    return parser.parse_args()


def print_header(text, char="="):
    """Imprime un encabezado formateado."""
    print(f"\n{char * 60}")
    print(f"  {text}")
    print(f"{char * 60}\n")


def print_success(text):
    """Imprime un mensaje de éxito."""
    print(f" ✅ {text}")


def print_error(text):
    """Imprime un mensaje de error."""
    print(f" ❌ {text}", file=sys.stderr)


def print_info(text):
    """Imprime un mensaje informativo."""
    print(f" ℹ️  {text}")


def print_warning(text):
    """Imprime un mensaje de advertencia."""
    print(f" ⚠️  {text}")


def check_requirements():
    """Verifica que las herramientas necesarias estén disponibles."""
    missing = []
    
    # Verificar hyprctl (opcional pero recomendado)
    if not shutil.which("hyprctl"):
        print_warning("hyprctl no encontrado. La recarga automática no funcionará.")
    
    # Verificar notify-send (opcional)
    if not shutil.which("notify-send"):
        print_warning("notify-send no encontrado. Las notificaciones no funcionarán.")
    
    return len(missing) == 0


def copy_path(src, dest, dry_run=False, overwrite_dirs=False):
    """Copia archivos o directorios respetando el modo dry-run."""
    if not os.path.exists(src):
        print_error(f"Origen no existe: {src}")
        return False
    
    if dry_run:
        print(f"   [dry-run] Copiaría '{src}' -> '{dest}'")
        return True
    
    try:
        # Crear directorio padre si no existe
        os.makedirs(os.path.dirname(dest), exist_ok=True)
        
        if os.path.isdir(src) and not os.path.islink(src):
            if os.path.exists(dest):
                shutil.rmtree(dest, ignore_errors=True)
            shutil.copytree(src, dest, symlinks=True, dirs_exist_ok=overwrite_dirs)
        else:
            shutil.copy2(src, dest)
        
        return True
    except Exception as e:
        print_error(f"Error al copiar '{src}' -> '{dest}': {e}")
        return False


def remove_path(target, dry_run=False):
    """Elimina archivos o directorios de forma segura respetando el modo dry-run."""
    if not os.path.exists(target):
        return True
    
    if dry_run:
        print(f"   [dry-run] Eliminaría '{target}'")
        return True
    
    try:
        if os.path.isdir(target) and not os.path.islink(target):
            shutil.rmtree(target, ignore_errors=True)
        else:
            os.remove(target)
        return True
    except Exception as e:
        print_error(f"Error al eliminar '{target}': {e}")
        return False


def create_backup(src_paths, backup_dir, dry_run=False):
    """Crea copias de seguridad de los archivos especificados."""
    if dry_run:
        print_info(f"[dry-run] Crearía backup en: {backup_dir}")
        return backup_dir
    
    timestamp = datetime.datetime.now().strftime('%Y%m%d-%H%M%S')
    backup_session_dir = os.path.join(backup_dir, f'backup-{timestamp}')
    
    try:
        os.makedirs(backup_session_dir, exist_ok=True)
        
        for src in src_paths:
            if os.path.exists(src):
                rel_path = os.path.relpath(src, os.path.expanduser("~"))
                backup_path = os.path.join(backup_session_dir, rel_path)
                os.makedirs(os.path.dirname(backup_path), exist_ok=True)
                
                if os.path.isdir(src):
                    shutil.copytree(src, backup_path, symlinks=True, dirs_exist_ok=True)
                else:
                    shutil.copy2(src, backup_path)
        
        return backup_session_dir
    except Exception as e:
        print_error(f"Error al crear backup: {e}")
        return None


def generate_hyprpaper_config(home_dir, dry_run=False):
    """Genera el archivo hyprpaper.conf con la configuración correcta."""
    hyprpaper_conf = os.path.join(home_dir, '.config', 'hypr', 'hyprpaper.conf')
    
    if dry_run:
        print_info("[dry-run] Generaría hyprpaper.conf")
        return
    
    # Buscar wallpaper por defecto
    wallpaper_paths = [
        os.path.join(home_dir, '.config', 'hypr', 'wallpaper.png'),
        os.path.join(home_dir, '.config', 'hypr', 'wallpaper.jpg'),
        os.path.join(home_dir, '.config', 'hypr', 'wallpaper.webp'),
    ]
    
    default_wallpaper = None
    for path in wallpaper_paths:
        if os.path.exists(path):
            default_wallpaper = path
            break
    
    # Si no hay wallpaper, buscar en wallpapers/
    if not default_wallpaper:
        wallpapers_dir = os.path.join(home_dir, '.config', 'wallpapers')
        if os.path.exists(wallpapers_dir):
            # Buscar wallpapers en diferentes formatos
            for ext in ['png', 'jpg', 'jpeg', 'webp']:
                wallpapers = glob.glob(os.path.join(wallpapers_dir, f'*.{ext}'))
                if wallpapers:
                    default_wallpaper = wallpapers[0]
                    break
    
    if not default_wallpaper:
        print_warning("No se encontró wallpaper por defecto. hyprpaper.conf se generará sin wallpaper.")
        default_wallpaper = os.path.join(home_dir, '.config', 'hypr', 'wallpaper.png')
    
    # Obtener monitores
    monitors = []
    try:
        result = subprocess.run(
            ['hyprctl', 'monitors', '-j'],
            capture_output=True,
            text=True,
            timeout=5
        )
        if result.returncode == 0:
            monitors_data = json.loads(result.stdout)
            monitors = [m.get('name', '') for m in monitors_data if m.get('name')]
    except Exception as e:
        print_warning(f"No se pudieron detectar monitores: {e}")
        # Si falla, usar sintaxis genérica
    
    # Generar archivo
    try:
        os.makedirs(os.path.dirname(hyprpaper_conf), exist_ok=True)
        with open(hyprpaper_conf, 'w') as f:
            f.write("# ============================================================================\n")
            f.write("# HYPRPAPER CONFIGURATION - Generado automáticamente por actualizar.py\n")
            f.write("# ============================================================================\n")
            f.write("# Este archivo se sobrescribe automáticamente por:\n")
            f.write("#   - theme-switcher.sh (Super + A) al cambiar temas\n")
            f.write("#   - wallpaper-switcher.sh (Super + W) al cambiar wallpapers\n")
            f.write("# ============================================================================\n\n")
            
            f.write(f"preload = {default_wallpaper}\n")
            
            if monitors:
                for monitor in monitors:
                    f.write(f"wallpaper = {monitor},{default_wallpaper}\n")
            else:
                # Sintaxis genérica si no se pueden detectar monitores
                f.write(f"wallpaper = ,{default_wallpaper}\n")
        
        print_success(f"hyprpaper.conf generado correctamente")
    except Exception as e:
        print_error(f"Error al generar hyprpaper.conf: {e}")


def reload_hyprland(dry_run=False):
    """Recarga Hyprland y servicios relacionados."""
    if dry_run:
        print_info("[dry-run] Recargaría Hyprland y servicios")
        return
    
    commands = [
        ("killall waybar 2>/dev/null; waybar &", "Recargando Waybar"),
        ("hyprctl reload", "Recargando Hyprland"),
        ("killall hyprpaper 2>/dev/null; hyprpaper & disown", "Recargando Hyprpaper"),
    ]
    
    for cmd, desc in commands:
        try:
            print_info(desc + "...")
            result = subprocess.run(
                cmd,
                shell=True,
                capture_output=True,
                text=True,
                timeout=10
            )
            if result.returncode != 0 and "killall" not in cmd:
                print_warning(f"Comando falló: {desc}")
                if result.stderr:
                    print(f"   Error: {result.stderr.strip()}")
        except subprocess.TimeoutExpired:
            print_warning(f"Timeout al ejecutar: {desc}")
        except Exception as e:
            print_warning(f"Error al ejecutar '{desc}': {e}")
    
    # Notificación final
    try:
        subprocess.run(
            ['notify-send', 'Hyprdots', 'Actualización completada con éxito!'],
            timeout=5
        )
    except:
        pass  # Notificación opcional


def main():
    """Función principal del script."""
    args = parse_args()
    
    # Obtener rutas
    script_dir = Path(__file__).parent.absolute()
    ruta_actual = str(script_dir)
    ruta_usuario = os.path.expanduser("~")
    
    config_dir = os.path.join(ruta_actual, "config")
    home_dir = os.path.join(ruta_actual, "home")
    
    # Validar directorios fuente
    if not os.path.exists(config_dir):
        print_error(f"Directorio 'config' no encontrado en: {ruta_actual}")
        sys.exit(1)
    
    if not os.path.exists(home_dir):
        print_warning(f"Directorio 'home' no encontrado en: {ruta_actual}")
        home_dir = None
    
    # Verificar requisitos
    check_requirements()
    
    # Obtener lista de items
    try:
        config_items = [item for item in os.listdir(config_dir) 
                       if not item.startswith('.')]
        home_items = os.listdir(home_dir) if home_dir and os.path.exists(home_dir) else []
    except Exception as e:
        print_error(f"Error al leer directorios: {e}")
        sys.exit(1)
    
    # Mostrar información inicial
    print_header("Hyprdots - Actualizador de Configuraciones")
    print_info(f"Repositorio: {ruta_actual}")
    print_info(f"Destino: {ruta_usuario}")
    print_info(f"Items en config/: {len(config_items)}")
    if home_items:
        print_info(f"Items en home/: {len(home_items)}")
    
    if args.dry_run:
        print_warning("Modo DRY-RUN habilitado - No se realizarán cambios")
    
    print_warning("Este script eliminará las carpetas antiguas y las reemplazará por las nuevas.")
    print_warning("Asegúrate de haber respaldado cualquier cambio local antes de continuar.")
    
    # Confirmación del usuario
    try:
        input('\n ⏎  Presiona Enter para continuar o Ctrl+C para cancelar...')
    except KeyboardInterrupt:
        print('\n\n ❌ Proceso cancelado por el usuario.\n')
        sys.exit(0)
    
    print_header("Iniciando Proceso de Actualización", "-")
    
    # Preparar rutas de destino
    config_targets = [
        os.path.join(ruta_usuario, '.config', item) for item in config_items
    ]
    home_targets = [
        os.path.join(ruta_usuario, item) for item in home_items
    ] if home_items else []
    
    # Crear backups si es necesario
    backup_session_dir = None
    if not args.skip_backup:
        targets_to_backup = [t for t in config_targets + home_targets if os.path.exists(t)]
        if targets_to_backup:
            print_info("Creando copias de seguridad...")
            backup_session_dir = create_backup(
                targets_to_backup,
                os.path.expanduser(args.backup_dir),
                args.dry_run
            )
            if backup_session_dir:
                print_success(f"Backup creado en: {backup_session_dir}")
        else:
            print_info("No hay archivos existentes para respaldar")
    
    # Procesar configuraciones de ~/.config
    print_header("Actualizando Configuraciones de ~/.config", "-")
    errors = []
    
    for item in config_items:
        origen = os.path.join(config_dir, item)
        destino = os.path.join(ruta_usuario, '.config', item)
        
        print_info(f"Procesando: {item}")
        
        # Backup individual si existe
        if os.path.exists(destino) and backup_session_dir:
            respaldo = os.path.join(backup_session_dir, '.config', item)
            if not copy_path(destino, respaldo, args.dry_run, overwrite_dirs=False):
                errors.append(f"Backup de {item}")
        
        # Eliminar destino y copiar origen
        if not remove_path(destino, args.dry_run):
            errors.append(f"Eliminación de {item}")
        
        if not copy_path(origen, destino, args.dry_run, overwrite_dirs=True):
            errors.append(f"Copia de {item}")
        else:
            print_success(f"  {item} actualizado")
    
    # Procesar archivos del home
    if home_items:
        print_header("Actualizando Archivos del Home", "-")
        for item in home_items:
            origen = os.path.join(home_dir, item)
            destino = os.path.join(ruta_usuario, item)
            
            print_info(f"Procesando: {item}")
            
            # Backup individual si existe
            if os.path.exists(destino) and backup_session_dir:
                respaldo = os.path.join(backup_session_dir, 'home', item)
                if not copy_path(destino, respaldo, args.dry_run, overwrite_dirs=False):
                    errors.append(f"Backup de {item}")
            
        # Si es el directorio hypr, copiar excluyendo hyprpaper.conf
        if item == 'hypr' and os.path.isdir(origen):
            # Eliminar destino
            if not remove_path(destino, args.dry_run):
                errors.append(f"Eliminación de {item}")
            
            # Copiar directorio excluyendo hyprpaper.conf
            if not args.dry_run:
                os.makedirs(destino, exist_ok=True)
                for root, dirs, files in os.walk(origen):
                    rel_root = os.path.relpath(root, origen)
                    dest_root = os.path.join(destino, rel_root) if rel_root != '.' else destino
                    os.makedirs(dest_root, exist_ok=True)
                    
                    for file in files:
                        if file == 'hyprpaper.conf':
                            continue  # Excluir hyprpaper.conf
                        src_file = os.path.join(root, file)
                        dst_file = os.path.join(dest_root, file)
                        try:
                            shutil.copy2(src_file, dst_file)
                        except Exception as e:
                            print_error(f"Error al copiar {src_file}: {e}")
                            errors.append(f"Copia de {item}/{file}")
                    
                    for dir_name in dirs:
                        src_dir = os.path.join(root, dir_name)
                        dst_dir = os.path.join(dest_root, dir_name)
                        try:
                            if os.path.exists(dst_dir):
                                shutil.rmtree(dst_dir)
                            shutil.copytree(src_dir, dst_dir, symlinks=True)
                        except Exception as e:
                            print_error(f"Error al copiar {src_dir}: {e}")
                            errors.append(f"Copia de {item}/{dir_name}")
                print_success(f"  {item} actualizado (hyprpaper.conf excluido, se generará después)")
            else:
                print(f"   [dry-run] Copiaría '{origen}' -> '{destino}' (excluyendo hyprpaper.conf)")
        else:
            # Para otros items, copiar normalmente
            if not remove_path(destino, args.dry_run):
                errors.append(f"Eliminación de {item}")
            
            if not copy_path(origen, destino, args.dry_run, overwrite_dirs=True):
                errors.append(f"Copia de {item}")
            else:
                print_success(f"  {item} actualizado")
    
    # Generar hyprpaper.conf correctamente después de copiar archivos
    print_info("Generando hyprpaper.conf con configuración correcta...")
    generate_hyprpaper_config(ruta_usuario, args.dry_run)
    
    # Mostrar resumen de errores
    if errors:
        print_header("Errores Encontrados", "-")
        for error in errors:
            print_error(error)
    
    if args.dry_run:
        print_header("Dry-Run Completado", "-")
        print_info("No se realizaron cambios en el sistema.")
        return
    
    # Recargar Hyprland si es necesario
    if not args.no_reload:
        print_header("Recargando Entorno", "-")
        reload_hyprland(args.dry_run)
        
        # Asegurar que hyprpaper se recargue con el nuevo wallpaper
        if not args.dry_run:
            print_info("Asegurando que hyprpaper use el nuevo wallpaper...")
            try:
                # Matar hyprpaper si está corriendo
                subprocess.run(['killall', 'hyprpaper'], 
                             capture_output=True, timeout=5)
                time.sleep(0.5)
                # Iniciar hyprpaper de nuevo
                subprocess.Popen(['hyprpaper'], 
                               stdout=subprocess.DEVNULL, 
                               stderr=subprocess.DEVNULL)
                print_success("Hyprpaper recargado")
            except Exception as e:
                print_warning(f"No se pudo recargar hyprpaper: {e}")
    
    # Mensaje final
    print_header("Proceso Completado", "=")
    if backup_session_dir:
        print_success(f"Backup guardado en: {backup_session_dir}")
    print_success("Configuraciones actualizadas correctamente")
    
    if errors:
        print_warning(f"Se encontraron {len(errors)} errores durante el proceso")
        sys.exit(1)
    else:
        print_success("¡Todo listo!")


if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print('\n\n ❌ Proceso interrumpido por el usuario.\n')
        sys.exit(1)
    except Exception as e:
        print_error(f"Error inesperado: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)

# Autor: Fravelz
