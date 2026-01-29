# 🔧 Guía de Mantenimiento - Hyprdots

Esta guía contiene información técnica sobre la estructura del proyecto, scripts de mantenimiento y cambios recientes.

---

## 📑 Contenido

1. [Estructura del Proyecto](#estructura-del-proyecto)
2. [Sistema de Temas](#sistema-de-temas)
3. [Scripts de Configuración](#scripts-de-configuración)
4. [Cambios Recientes](#cambios-recientes)
5. [Migración de Temas](#migración-de-temas)

---

## 📂 Estructura del Proyecto

### Organización Modular

El proyecto usa una estructura modular que facilita el mantenimiento:

```
config/
├── hypr/
│   ├── hyprland.conf          # Archivo principal (incluye módulos)
│   ├── colors.conf             # Colores del tema actual (se actualiza al cambiar tema)
│   ├── hyprpaper.conf          # Configuración de wallpaper (generado automáticamente)
│   └── conf.d/                 # Módulos de configuración
│       ├── monitors.conf       # Configuración de monitores
│       ├── environment.conf    # Variables de entorno
│       ├── autostart.conf      # Programas al inicio
│       ├── general.conf        # Look & feel (gaps, borders, animations)
│       ├── input.conf          # Configuración de teclado/ratón
│       ├── keybinds.conf       # Todos los atajos de teclado
│       ├── windows.conf        # Reglas de ventanas
│       └── theme-override.conf # Override del tema actual (generado automáticamente)
│
└── themes/
    └── [Nombre-Tema]/
        ├── hypr/
        │   ├── colors.conf           # REQUERIDO: Colores del tema
        │   ├── wallpaper.jpg         # REQUERIDO: Fondo de pantalla
        │   ├── theme-override.conf   # OPCIONAL: Override de configuraciones
        │   └── general.conf          # OPCIONAL: Override de look & feel
        │   └── hyprland.conf         # OPCIONAL: Solo para temas independientes
        ├── kitty/                     # OPCIONAL: Configuración de kitty
        ├── waybar/                    # OPCIONAL: Configuración de waybar
        └── rofi-style/                # OPCIONAL: Estilos de rofi
```

### Archivos de Configuración Modular

#### `conf.d/monitors.conf`
Configuración de monitores. Raramente necesita cambios.

#### `conf.d/environment.conf`
Variables de entorno. Generalmente no cambia entre temas.

#### `conf.d/autostart.conf`
Programas que se ejecutan al inicio. Compartido entre todos los temas.

#### `conf.d/general.conf`
Look & feel: gaps, borders, animaciones, decoración.
Los temas pueden sobrescribir esto con `theme-override.conf`.

#### `conf.d/input.conf`
Configuración de teclado y ratón. Compartido entre temas.

#### `conf.d/keybinds.conf`
Todos los atajos de teclado. Compartido entre temas.
**Mejora:** Eliminado código duplicado (flechas y HJKL ahora solo usan HJKL).

#### `conf.d/windows.conf`
Reglas de ventanas. Compartido entre temas.

#### `conf.d/theme-override.conf`
Generado automáticamente por `theme-switcher.sh`.
Contiene override específico del tema actual.

---

## 🎨 Sistema de Temas

### Tipos de Temas

#### 1. Tema Modular (Recomendado)

Un tema modular solo contiene las diferencias específicas. Ejemplo:

```
themes/Anime/
├── hypr/
│   ├── colors.conf           # Solo los colores diferentes
│   ├── wallpaper.jpg         # El wallpaper del tema
│   └── theme-override.conf   # (Opcional) Override específico
├── kitty/
│   └── colors.ini            # Colores de kitty
└── waybar/
    └── colors.css            # Colores de waybar
```

**Ventajas:**
- ✅ Fácil de mantener
- ✅ Reutiliza la configuración base
- ✅ Cambios en la base se aplican automáticamente
- ✅ Menos código duplicado

#### 2. Tema Independiente

Un tema independiente tiene su propio `hyprland.conf` completo. Ejemplo:

```
themes/Windows10/
├── hypr/
│   ├── hyprland.conf         # Configuración completa independiente
│   ├── colors.conf           # Colores
│   └── wallpaper.jpg         # Wallpaper
└── ...
```

**Cuándo usar:**
- Cuando el tema necesita cambios muy diferentes (ej: sin gaps, sin animaciones)
- Cuando quieres una configuración completamente separada

**Nota:** El script `theme-switcher.sh` detecta automáticamente si un tema es independiente.

### Crear un Nuevo Tema

#### Opción 1: Tema Modular (Recomendado)

1. Crear directorio del tema:
```bash
mkdir -p ~/.config/themes/Mi-Tema/hypr
```

2. Crear `colors.conf`:
```conf
# Colors
$background = rgba(1e1e2eff)
$foreground = rgba(cdd6f4ff)
$active_border1 = rgba(9ecddfee)
$active_border2 = rgba(aabbccaa)
$inactive_border = rgba(9ecddf11)
$shadow = rgba(00000099)
```

3. Agregar wallpaper:
```bash
cp mi-wallpaper.jpg ~/.config/themes/Mi-Tema/hypr/wallpaper.jpg
```

4. (Opcional) Crear `theme-override.conf` si necesitas cambios específicos:
```conf
# Ejemplo: Cambiar gaps solo para este tema
general {
    gaps_in = 10
    gaps_out = 20
}
```

#### Opción 2: Tema Independiente

1. Copiar un tema existente como base:
```bash
cp -r ~/.config/themes/Windows10 ~/.config/themes/Mi-Tema-Independiente
```

2. Modificar `hyprland.conf` según tus necesidades

3. El script detectará automáticamente que es independiente

### Ejemplos de Override

#### Ejemplo 1: Tema con gaps diferentes
```conf
# themes/Mi-Tema/hypr/theme-override.conf
general {
    gaps_in = 15
    gaps_out = 25
}
```

#### Ejemplo 2: Tema sin animaciones
```conf
# themes/Mi-Tema/hypr/theme-override.conf
animations {
    enabled = no
}
```

#### Ejemplo 3: Tema con bordes diferentes
```conf
# themes/Mi-Tema/hypr/theme-override.conf
decoration {
    rounding = 0
    border_size = 0
}
```

---

## 🛠️ Scripts de Configuración

### `actualizar.py`

Script principal para actualizar las configuraciones desde el repositorio.

#### Características

1. **Validación de Directorios**
   - Verifica que los directorios fuente existan antes de procesar
   - Maneja casos donde `home/` no existe
   - Mensajes de error claros si falta algo

2. **Mejor Manejo de Errores**
   - Captura y reporta errores específicos
   - Continúa procesando aunque haya errores individuales
   - Resumen final de errores encontrados
   - Códigos de salida apropiados

3. **Verificación de Requisitos**
   - Verifica que `hyprctl` esté disponible (opcional)
   - Verifica que `notify-send` esté disponible (opcional)
   - Advertencias claras si faltan herramientas

4. **Nuevas Opciones de Línea de Comandos**
   - `--no-reload`: No recarga Hyprland después de actualizar
   - `--skip-backup`: Omite la creación de backups (no recomendado)
   - `--backup-dir`: Directorio personalizado para backups
   - `--dry-run`: Modo de simulación (ya existía, mejorado)

5. **Generación Automática de hyprpaper.conf**
   - Detecta monitores automáticamente
   - Busca wallpapers en `~/.config/hypr/` y `~/.config/wallpapers/`
   - Genera configuración correcta con rutas absolutas
   - Excluye `hyprpaper.conf` del repositorio al copiar (se genera automáticamente)

#### Ejemplos de Uso

```bash
# Actualización normal
./actualizar.py

# Simular sin hacer cambios
./actualizar.py --dry-run

# Actualizar sin recargar Hyprland
./actualizar.py --no-reload

# Usar directorio personalizado para backups
./actualizar.py --backup-dir ~/mis_backups

# Actualizar sin crear backups (no recomendado)
./actualizar.py --skip-backup
```

### `permisos.sh`

Script para obtener permisos de configuración.

#### Características

1. **Detección Automática**
   - Detecta automáticamente el usuario actual (`$SUDO_USER` o `$USER`)
   - Detecta automáticamente la ruta del repositorio
   - No requiere rutas hardcodeadas

2. **Validaciones**
   - Verifica que el directorio `config/` exista
   - Verifica que los directorios destino existan antes de cambiar permisos
   - Manejo de errores mejorado

3. **Permisos de Ejecución Automáticos**
   - Otorga permisos de ejecución a scripts `.sh` en `rofi/`
   - Otorga permisos de ejecución a scripts en `scripts/`
   - Busca recursivamente scripts ejecutables

#### Ejemplos de Uso

```bash
# Ejecutar normalmente (solicitará sudo si es necesario)
./permisos.sh

# Ejecutar directamente con sudo
sudo ./permisos.sh
```

### `theme-switcher.sh`

Script mejorado para cambiar temas.

#### Características

- Validación de dependencias (rofi, hyprctl, jq)
- Detección automática de tipo de tema (modular/independiente)
- Generación automática de `hyprpaper.conf` con monitores detectados
- Manejo robusto de errores
- Feedback detallado durante el proceso
- Funciones organizadas para mejor mantenibilidad

### `wallpaper-switcher.sh`

Script para cambiar wallpapers.

#### Características

- Detecta automáticamente los monitores disponibles
- Muestra preview de wallpapers en rofi
- Genera configuración correcta para cada monitor
- Recarga hyprpaper automáticamente

---

## 🔄 Cambios Recientes

### Reorganización Modular (2024)

#### 1. Error Corregido
- ✅ Corregido error de sintaxis: `windowrule = suppressevent, maximize, class:.*`
- ⚠️ Nota: `suppressevent` no es compatible con Hyprland 0.53.3+, la regla está comentada

#### 2. Estructura Modular
- ✅ Dividido `hyprland.conf` en módulos organizados en `conf.d/`
- ✅ Cada aspecto de la configuración en su propio archivo
- ✅ Más fácil de mantener y extender

#### 3. Código Duplicado Eliminado
- ✅ Eliminados keybinds duplicados (flechas y HJKL ahora solo usan HJKL)
- ✅ Organizados keybinds por categorías
- ✅ Comentarios mejorados para mejor legibilidad

#### 4. Sistema de Temas Mejorado
- ✅ Nuevo `theme-switcher.sh` que detecta automáticamente temas modulares/independientes
- ✅ Los temas ahora pueden tener `theme-override.conf` para cambios específicos
- ✅ Sistema más fácil de mantener y extender

#### 5. Scripts de Utilidad
- ✅ `config/scripts/migrate-themes.sh` - Ayuda a migrar temas antiguos
- ✅ Scripts con mejor manejo de errores y mensajes informativos

#### 6. Hyprpaper Mejorado
- ✅ Generación automática de `hyprpaper.conf` con monitores detectados
- ✅ Soporte para múltiples monitores
- ✅ Scripts actualizados para usar sintaxis correcta

### Archivos Creados/Modificados

#### Nuevos Archivos:
```
config/hypr/
├── conf.d/
│   ├── monitors.conf
│   ├── environment.conf
│   ├── autostart.conf
│   ├── general.conf
│   ├── input.conf
│   ├── keybinds.conf
│   ├── windows.conf
│   └── theme-override.conf
config/scripts/
├── migrate-themes.sh
└── rename-wallpapers.sh
```

#### Archivos Modificados:
```
config/hypr/hyprland.conf (ahora modular)
config/rofi/theme-switcher.sh (mejorado)
config/rofi/wallpaper-switcher.sh (mejorado)
actualizar.py (mejorado)
permisos.sh (mejorado)
```

---

## 🔄 Migración de Temas

### Migrar Temas Existentes

Los temas existentes seguirán funcionando, pero puedes optimizarlos:

```bash
# Ejecutar script de migración (opcional)
~/.config/scripts/migrate-themes.sh
```

Este script:
- Detecta temas con `hyprland.conf` completo
- Extrae `colors.conf` si no existe
- Crea `theme-override.conf` con diferencias específicas
- Hace backup de archivos originales

### Pasos Manuales

1. **Eliminar `hyprland.conf` completo** del tema (si no es independiente)
2. **Mantener solo `colors.conf`** y `wallpaper.jpg`
3. **Agregar `theme-override.conf`** solo si necesitas cambios específicos

---

## ⚠️ Notas Importantes

1. **Los temas existentes siguen funcionando** - No necesitas migrarlos inmediatamente
2. **Windows10 es un tema independiente** - Se mantiene como está
3. **El archivo `theme-override.conf` se regenera automáticamente** - No edites directamente
4. **Siempre prueba con `hyprctl reload`** antes de cerrar sesión
5. **Haz backup** antes de cambios importantes

---

## 🐛 Solución de Problemas

### El tema no se aplica:
1. Verifica que `colors.conf` existe en el tema
2. Verifica que `theme-override.conf` se generó correctamente
3. Revisa los logs: `hyprctl reload` debería mostrar errores

### Error de sintaxis:
1. Verifica que los archivos `.conf` tienen sintaxis válida
2. Usa `hyprctl reload` para ver errores específicos

### Tema independiente no funciona:
1. Copia manualmente: `cp themes/[Tema]/hypr/hyprland.conf ~/.config/hypr/hyprland.conf`
2. O convierte el tema a modular eliminando `hyprland.conf` del tema

### Hyprpaper no funciona:
1. Verifica que el archivo existe: `~/.config/hypr/hyprpaper.conf`
2. Verifica que hyprpaper está corriendo: `ps aux | grep hyprpaper`
3. Reinicia hyprpaper: `killall hyprpaper && hyprpaper &`
4. Verifica que el wallpaper existe y es accesible

---

## 📊 Comparación Antes/Después

### `actualizar.py`

| Aspecto | Antes | Después |
|---------|-------|---------|
| Validación | Básica | Completa con mensajes claros |
| Manejo de errores | Básico | Robusto con resumen final |
| Mensajes | Simples | Con colores y formato |
| Opciones | 2 | 5 |
| Timeouts | No | Sí |
| Verificación de herramientas | No | Sí |
| Generación de hyprpaper.conf | No | Sí (automática) |

### `permisos.sh`

| Aspecto | Antes | Después |
|---------|-------|---------|
| Usuario | Hardcodeado (`fravelz`) | Detectado automáticamente |
| Ruta | Hardcodeada | Detectada automáticamente |
| Validaciones | No | Sí |
| Permisos de ejecución | No | Automáticos |
| Mensajes | Simples | Con colores |
| Manejo de errores | Básico | Robusto |

---

## 🎯 Beneficios de la Nueva Estructura

✅ **Más fácil de mantener**: Cambios en un lugar se aplican a todos los temas  
✅ **Menos código duplicado**: Los temas solo contienen diferencias  
✅ **Más flexible**: Soporta temas modulares e independientes  
✅ **Mejor organización**: Cada aspecto de la configuración en su propio archivo  
✅ **Fácil de extender**: Agregar nuevos temas es más simple  
✅ **Scripts más robustos**: Mejor manejo de errores y validaciones  

---

**Autor:** Fravelz  
**Última actualización:** Reorganización modular 2024
