# 📖 Guía de Uso - Hyprdots

Esta guía contiene toda la información necesaria para usar y personalizar tu configuración de Hyprdots.

---

## 📑 Contenido

1. [Atajos de Teclado](#atajos-de-teclado)
2. [Gestión de Temas](#gestión-de-temas)
3. [Cambiar Wallpapers](#cambiar-wallpapers)
4. [Estructura de Configuración](#estructura-de-configuración)

---

## ⌨️ Atajos de Teclado

### Modificadores Principales

- `$mainMod = SUPER` → tecla **Windows / Super**
- `$secondMod = SUPER_SHIFT` → **Windows + Shift**

### Gestión de Ventanas

| Atajo              | Acción                                                          |
| ------------------ | --------------------------------------------------------------- |
| **Super + Return** | Abrir terminal (`kitty`)                                        |
| **Super + C**      | Cerrar ventana activa                                           |
| **Super + M**      | Salir de sesión Hyprland                                        |
| **Super + U**      | Alternar modo flotante                                          |
| **Super + P**      | Activar/desactivar pseudotile (mantiene tamaño fijo de ventana) |
| **Super + O**      | Cambiar modo de división (*toggle split*)                       |
| **Super + F**      | Abrir Firefox                                                   |
| **Super + Z**      | Abrir herramienta de captura (`flameshot gui`)                  |

### Menús Personalizados

| Atajo                      | Acción                                                       |
| -------------------------- | ------------------------------------------------------------ |
| **Super + D**              | Abrir lanzador de aplicaciones (`rofi -show drun`)           |
| **Super + Q**              | Abrir menú de apagado (`~/.config/rofi/power-menu.sh`)      |
| **Super + A**              | Abrir cambiador de temas (`~/.config/rofi/theme-switcher.sh`) |
| **Super + W**              | Abrir cambiador de fondos (`~/.config/rofi/wallpaper-switcher.sh`) |
| **Super + E**              | Menú de iconos (`~/.config/rofi/menu-iconos.sh`)              |
| **Super + Shift + Return** | Activar "modo hacker" (`~/.config/rofi/mode-hacker.sh`)       |

### Movimiento entre Ventanas

| Atajo                     | Acción                                                 |
| ------------------------- | ------------------------------------------------------ |
| **Super + ← / → / ↑ / ↓** | Mover foco entre ventanas (izq / der / arriba / abajo) |
| **Super + H / L / K / J** | Mover foco (equivalente a las flechas)                 |

### Espacios de Trabajo (Workspaces)

| Atajo                     | Acción                                             |
| ------------------------- | -------------------------------------------------- |
| **Super + [1–0]**         | Cambiar al workspace correspondiente               |
| **Super + Shift + [1–0]** | Mover ventana activa al workspace correspondiente  |
| **Super + S**             | Activar workspace especial "magic"                 |
| **Super + Shift + S**     | Mover ventana activa al workspace especial "magic" |
| **Super + Scroll Up**     | Ir al workspace anterior                           |
| **Super + Scroll Down**   | Ir al siguiente workspace                          |

### Gestos del Ratón

| Atajo                                  | Acción                |
| -------------------------------------- | --------------------- |
| **Super + clic izquierdo (mouse:272)** | Mover ventana         |
| **Super + clic derecho (mouse:273)**   | Redimensionar ventana |

### Multimedia

| Atajo                     | Acción                        |
| ------------------------- | ----------------------------- |
| **XF86AudioRaiseVolume**  | Subir volumen (+5%)           |
| **XF86AudioLowerVolume**  | Bajar volumen (-5%)           |
| **XF86AudioMute**         | Silenciar / activar sonido    |
| **XF86AudioMicMute**      | Silenciar / activar micrófono |
| **XF86AudioNext**         | Siguiente pista (playerctl)   |
| **XF86AudioPrev**         | Pista anterior                |
| **XF86AudioPlay / Pause** | Reproducir / pausar           |

### Brillo

| Atajo                     | Acción             |
| ------------------------- | ------------------ |
| **XF86MonBrightnessUp**   | Subir brillo (+5%) |
| **XF86MonBrightnessDown** | Bajar brillo (-5%) |

### Comandos Básicos dentro de Kitty

| Acción                            | Atajo por defecto              | Descripción                                   |
| :-------------------------------- | :----------------------------- | :-------------------------------------------- |
| **Nueva pestaña**                 | `Ctrl + Shift + t`             | Abre una pestaña nueva.                       |
| **Cerrar pestaña actual**         | `Ctrl + Shift + w`             | Cierra la pestaña activa.                     |
| **Cambiar entre pestañas**        | `Ctrl + Shift + → / ←`         | Mueve entre pestañas.                         |
| **Dividir ventana verticalmente** | `Ctrl + Shift + Enter`         | Divide el terminal en dos paneles (vertical). |
| **Dividir horizontalmente**       | `Ctrl + Shift + d`             | Divide en dos horizontalmente.                |
| **Mover entre paneles**           | `Ctrl + Shift + ↑ / ↓ / → / ←` | Cambia el foco entre paneles.                 |
| **Cerrar panel actual**           | `Ctrl + Shift + q`             | Cierra solo el panel activo.                  |
| **Zoom + / -**                    | `Ctrl + + / -`                 | Aumenta o reduce el tamaño de fuente.         |
| **Resetear zoom**                 | `Ctrl + 0`                     | Restaura el tamaño original.                  |
| **Abrir configuración**           | `Ctrl + Shift + f2`            | Abre el archivo `kitty.conf` para editar.     |
| **Recargar configuración**        | `Ctrl + Shift + f5`            | Aplica cambios sin reiniciar.                 |

### Atajos de Terminal (Bash/Zsh)

#### Atajos Básicos (idénticos a Bash)

| Atajo      | Acción                                    |
| ---------- | ----------------------------------------- |
| `Ctrl + A` | Ir al inicio de la línea                  |
| `Ctrl + E` | Ir al final de la línea                   |
| `Ctrl + U` | Borrar todo antes del cursor              |
| `Ctrl + K` | Borrar todo después del cursor            |
| `Ctrl + W` | Borrar la palabra anterior                |
| `Ctrl + Y` | Pegar lo borrado (yank)                   |
| `Ctrl + L` | Limpiar la pantalla                       |
| `Ctrl + R` | Buscar en el historial                    |
| `Ctrl + C` | Cancelar el comando actual                |
| `Ctrl + D` | Cerrar la sesión (si la línea está vacía) |
| `Alt + B`  | Moverse una palabra atrás                 |
| `Alt + F`  | Moverse una palabra adelante              |

#### Atajos Especiales de Zsh (ZLE)

| Atajo                | Acción                                                                     |
| -------------------- | -------------------------------------------------------------------------- |
| `Ctrl + X, Ctrl + E` | Edita el comando actual en tu editor ($EDITOR, por defecto *nano* o *vim*) |
| `Ctrl + X, Ctrl + U` | Deshacer cambios en la línea                                               |
| `Alt + .`            | Inserta el último argumento del comando anterior                           |
| `Esc + /`            | Autocompleta desde el historial                                            |
| `Ctrl + X, *`        | Expande un patrón tipo `*.txt` directamente                                |
| `Ctrl + X, Q`        | Cita (escapa) caracteres especiales automáticamente                        |

**Resumen:** Existen **41 atajos activos** en Hyprland.

---

## 🎨 Gestión de Temas

### Cambiar Tema

Usa el atajo **Super + A** o ejecuta manualmente:

```bash
~/.config/rofi/theme-switcher.sh
```

El script detecta automáticamente si un tema es:
- **Modular**: Solo colores y override específicos (recomendado)
- **Independiente**: Tiene su propio `hyprland.conf` completo (ej: Windows10)

### Tipos de Temas

#### Tema Modular (Recomendado)

Un tema modular solo contiene las diferencias específicas:

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

#### Tema Independiente

Un tema independiente tiene su propio `hyprland.conf` completo. Se usa cuando el tema necesita cambios muy diferentes (ej: sin gaps, sin animaciones).

### Crear un Nuevo Tema Modular

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

### Ver Tema Actual

El tema actual se refleja en:
- `~/.config/hypr/colors.conf` (colores)
- `~/.config/hypr/conf.d/theme-override.conf` (override)

---

## 🖼️ Cambiar Wallpapers

### Usar el Selector de Wallpapers

Usa el atajo **Super + W** o ejecuta manualmente:

```bash
~/.config/rofi/wallpaper-switcher.sh
```

Este script:
- Muestra todos los wallpapers de `~/.config/wallpapers/`
- Detecta automáticamente los monitores disponibles
- Aplica el wallpaper seleccionado a todos los monitores
- Recarga hyprpaper automáticamente

### Wallpapers Renombrados

Los wallpapers ahora tienen nombres descriptivos usando guiones:
- `abstract-colorful-1.webp`
- `anime-green-woman.webp`
- `batman-dark-1.jpg`
- `cyberpunk-pixel-city.webp`
- etc.

---

## 📂 Estructura de Configuración

### Archivos Principales

```
~/.config/hypr/
├── hyprland.conf          # Archivo principal (incluye módulos)
├── colors.conf             # Colores del tema actual
├── hyprpaper.conf          # Configuración de wallpaper
└── conf.d/                 # Módulos de configuración
    ├── monitors.conf       # Configuración de monitores
    ├── environment.conf    # Variables de entorno
    ├── autostart.conf      # Programas al inicio
    ├── general.conf        # Look & feel (gaps, borders, animations)
    ├── input.conf          # Configuración de teclado/ratón
    ├── keybinds.conf       # Todos los atajos de teclado
    ├── windows.conf        # Reglas de ventanas
    └── theme-override.conf # Override del tema actual (generado automáticamente)
```

### Editar Configuración

- **Keybinds**: `~/.config/hypr/conf.d/keybinds.conf`
- **Look & Feel**: `~/.config/hypr/conf.d/general.conf`
- **Input**: `~/.config/hypr/conf.d/input.conf`
- **Monitores**: `~/.config/hypr/conf.d/monitors.conf`

### Recargar Configuración

Después de editar cualquier archivo de configuración:

```bash
hyprctl reload
```

---

## 🛠️ Mantenimiento Básico

### Agregar un Nuevo Keybind

Editar `~/.config/hypr/conf.d/keybinds.conf` y agregar:

```conf
bind = $mainMod, X, exec, mi-aplicacion
```

Luego recargar: `hyprctl reload`

### Modificar un Tema Específico

1. Editar `~/.config/themes/[Tema]/hypr/theme-override.conf`
2. O crear uno nuevo si no existe
3. Cambiar al tema para aplicar cambios

### Solución de Problemas

#### El tema no se aplica:
1. Verifica que `colors.conf` existe en el tema
2. Verifica que `theme-override.conf` se generó correctamente
3. Revisa los logs: `hyprctl reload` debería mostrar errores

#### Error de sintaxis:
1. Verifica que los archivos `.conf` tienen sintaxis válida
2. Usa `hyprctl reload` para ver errores específicos

#### Hyprpaper no funciona:
1. Verifica que el archivo existe: `~/.config/hypr/hyprpaper.conf`
2. Verifica que hyprpaper está corriendo: `ps aux | grep hyprpaper`
3. Reinicia hyprpaper: `killall hyprpaper && hyprpaper &`

---

**Autor:** Fravelz  
**Última actualización:** Reorganización modular 2024
