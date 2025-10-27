#!/usr/bin/env python

import subprocess
import shutil
import os

# Definir rutas ******************************************************

ruta_usuario = os.path.expanduser("~")

ruta_hyprdots = f'{ruta_usuario}/Documentos/Hyprdots'
ruta_config = f'{ruta_usuario}/.config'

configuraciones_config = [
    'rofi',
    'fastfetch',
    'hypr',
    'kitty',
    'nvim',
    'themes',
    'wallpapers',
    'waybar'
]

configuraciones_home = [
    '.zshrc'
    # '.bashrc',
]

# Confirmacion del usuario *******************************************

print('\n [!] Este script eliminara las carpetas antiguas de las configuraciones y las reemplazara por las nuevas.')
print(' [!] Asegurate de haber respaldado cualquier cambio local antes de continuar.')

try:
    input(' [!] Presiona Enter para continuar o Ctrl+C para cancelar...')

except KeyboardInterrupt:
    print('\n\n [!] Proceso de actualizacion cancelado por el usuario.\n')
    exit()

print('\n [!] Iniciando proceso de actualizacion...')

# Eliminar carpetas antiguas y crear nuevas **************************

for configuracion in configuraciones_config:
    carpeta = os.path.expanduser(f'{ruta_config}/{configuracion}')

    # Borrar la carpeta (como rm -rf)
    if os.path.exists(carpeta):
        shutil.rmtree(carpeta, ignore_errors=True)

    # Volver a crearla vacía
    os.makedirs(carpeta)

print('\n [+] Carpetas eliminadas, ejecutando creacion de carpetas...')

# Pasar nuevas configuraciones ***************************************

for configuracion in configuraciones_config:
    carpeta_origen = f'{ruta_hyprdots}/config/{configuracion}'
    carpeta_destino = f'{ruta_config}/{configuracion}'

    # Copiar la carpeta desde Hyprdots a .config
    shutil.copytree(carpeta_origen, carpeta_destino, dirs_exist_ok=True)

# Sobrescribir archivos en el home ***********************************

print('\n [+] Carpetas creadas, ejecutando actualizacion/creacion archivos en el home...')

for configuracion in configuraciones_home:
    archivo_origen = f'{ruta_hyprdots}/home/{configuracion}'
    archivo_destino = f'{ruta_usuario}/{configuracion}'

    # Si ya existe el archivo, eliminarlo antes de copiar
    if os.path.exists(archivo_destino):
        os.remove(archivo_destino)

    # Copiar el archivo desde Hyprdots al home
    shutil.copy2(archivo_origen, archivo_destino)

print('\n [+] Configuraciones actualizadas, recargando entorno...')

# Recargar entorno y notificar al usuario ****************************

recargar_e_informar = [
    "killall waybar && waybar &",
    "hyprctl reload",
    "killall hyprpaper",
    "hyprpaper & disown",
    'notify-send "Hyprdots: Actualizacion completada con exito!"'
]

# Ejecutar cada comando
for comando in recargar_e_informar: 
    subprocess.run(comando, shell=True)

print('\n [!] Proceso de actualizacion finalizado. \n')

# Autor: Fravelz
