# Notificaciones con Mako (Hyprdots)

Guía de la configuración de notificaciones en Hyprdots: mako + waybar.

---

## 1. Resumen

- **Daemon:** mako (notificaciones para Wayland).
- **Envío:** `notify-send` / libnotify (theme-switcher, wallpaper-switcher, actualizar.py, etc.).
- **Estilo:** `config/mako/config` (fondo mantle #181825, borde teal #94e2d5, bordes redondeados).
- **Autostart:** mako se inicia con Hyprland (`config/hypr/conf.d/autostart.conf`).
- **Waybar:** módulo `custom/notification` (icono 󰂚, clic = descartar todas, clic derecho = no molestar).

**Si el estilo se ve igual que siempre (azul por defecto):** mako no ha recargado la config. Reinicia mako:
```bash
killall mako; mako &
```
O ejecuta `actualizar.py` (reinicia mako al final). Asegúrate de tener `config/mako/config` en `~/.config/mako/`.

---

## 2. Configuración de mako (`config/mako/config`)

### Posición y capa

- **anchor:** `top-right` (esquina superior derecha).
- **layer:** `overlay` (encima de ventanas en fullscreen).

### Estilo

- **Colores:** fondo `#181825` (mantle), texto `#cdd6f4`, borde `#94e2d5` (teal).
- **Bordes:** 3px, `border-radius` 14px (visibles; distinto del default azul).
- **Fuente:** JetBrainsMono Nerd Font 11 (misma que waybar).
- **Iconos:** activados, tamaño máx. 48px, esquinas redondeadas.

### Comportamiento

- **Formato:** título en negrita, cuerpo debajo (`<b>%s</b>\n%b`).
- **Agrupación:** por aplicación (`group-by = app-name`).
- **Orden:** más recientes primero (`sort = -time`).
- **Historial:** hasta 20 notificaciones (`max-history = 20`).
- **Timeout:** 5 s por defecto; críticas no se cierran solas.

### Urgencias

| Urgencia   | Borde      | Fondo     | Timeout |
|------------|------------|-----------|---------|
| low        | `#6c7086`  | `#313244` | 3 s     |
| normal     | `#94e2d5`  | `#181825` | 5 s     |
| critical   | `#f38ba8`  | `#181825` | 0 (fijo)|

### Clic en notificaciones

- **Clic izquierdo:** acción por defecto (abrir app, etc.).
- **Clic derecho:** descartar.
- **Clic medio:** menú de acciones (`makoctl menu` + rofi). Requiere **jq** y **rofi**.

---

## 3. Waybar

- **Módulo:** `custom/notification`.
- **Condición:** solo si existe `mako` (`exec-if`: `which mako`).
- **Icono:** 󰂚.
- **Clic:** `makoctl dismiss -a` (descartar todas).
- **Clic derecho:** `makoctl mode -a dnd` (no molestar).
- **Tooltip:** explicación de los clics.

El módulo está en `group/group-5` (junto a bluetooth, battery, network).

## 3.1. Atajos Hyprland

En `config/hypr/conf.d/keybinds.conf`:

- **Super + N:** descartar todas las notificaciones (`makoctl dismiss -a`).
- **Super + Shift + N:** no molestar on/off (`makoctl mode -a dnd`).

---

## 4. Actualizar y permisos

- **actualizar.py:** copia `config/` a `~/.config/`, incluyendo `config/mako/`.
- **permisos.sh:** `mako` está en `CONFIG_DIRS`; al ejecutarlo se ajustan permisos de `~/.config/mako`.

---

## 5. Pruebas rápidas

```bash
# Ver notificación de prueba
notify-send "Título" "Cuerpo de la notificación"

# Crítica (no se cierra sola)
notify-send -u critical "Urgente" "Mensaje crítico"

# Descartar todas (también desde Waybar)
makoctl dismiss -a

# No molestar (toggle)
makoctl mode -a dnd
```

---

## 6. Personalizar

- **Colores:** edita `config/mako/config` y los bloques `[urgency=low|normal|critical]`.
- **Posición:** cambia `anchor` (p. ej. `bottom-right`, `top-center`).
- **Fuente:** ajusta `font` en la sección global.
- **Menú clic medio:** si no usas rofi, cambia `on-button-middle` a `dmenu` o desactívalo.

---

## 7. Requisitos

- **mako** y **libnotify** instalados.
- Para el menú de acciones (clic medio): **jq** y **rofi** (o sustituir por `dmenu`).

```bash
pacman -S mako libnotify
# opcional para menú:
pacman -S jq rofi
```
