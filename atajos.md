# Atajos de Teclado

---

## Temario

- [Atajos de Teclado](#atajos-de-teclado)
  - [Temario](#temario)
  - [🎮 Modificadores principales](#-modificadores-principales)
  - [🧩 Gestión de ventanas](#-gestión-de-ventanas)
  - [🧠 Menús personalizados](#-menús-personalizados)
  - [🧭 Movimiento entre ventanas](#-movimiento-entre-ventanas)
  - [🧱 Espacios de trabajo (Workspaces)](#-espacios-de-trabajo-workspaces)
  - [🖱️ Gestos del ratón](#️-gestos-del-ratón)
  - [🔊 Multimedia](#-multimedia)
  - [💡 Brillo](#-brillo)
  - [💬 Resumen total](#-resumen-total)
  - [⚙️ Comandos básicos dentro de Kitty](#️-comandos-básicos-dentro-de-kitty)
    - [⚡ Atajos básicos (idénticos a Bash)](#-atajos-básicos-idénticos-a-bash)
  - [Bash  y zsh Comandos](#bash--y-zsh-comandos)
    - [⚙️ Atajos especiales de Zsh (ZLE)](#️-atajos-especiales-de-zsh-zle)
    - [🧠 Si usas Oh My Zsh o Powerlevel10k](#-si-usas-oh-my-zsh-o-powerlevel10k)
    - [🧩 Ver o personalizar los atajos](#-ver-o-personalizar-los-atajos)

[Regresar a la guía principal](./readme.md#hyprdots)

---

## 🎮 Modificadores principales

- `$mainMod = SUPER` → tecla **Windows / Super**
- `$secondMod = SUPER_SHIFT` → **Windows + Shift**

---

## 🧩 Gestión de ventanas

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

---

## 🧠 Menús personalizados

| Atajo                      | Acción                                                       |
| -------------------------- | ------------------------------------------------------------ |
| **Super + D**              | Abrir lanzador de aplicaciones (`rofi -show drun`)           |
| **Super + Q**              | Abrir menú de apagado (`~/.config/bin/power-menu.sh`)        |
| **Super + A**              | Abrir cambiador de temas (`~/.config/bin/theme-switcher.sh`) |
| **Super + W**              | Abrir cambiador de fondos(`~/.config/bin/wallpaper-switcher.sh`) |
| **Super + E**              | Menú de iconos (`~/.config/bin/menu-iconos.sh`)              |
| **Super + Shift + Return** | Activar “modo hacker” (`~/.config/bin/mode-hacker.sh`)       |

---

## 🧭 Movimiento entre ventanas

| Atajo                     | Acción                                                 |
| ------------------------- | ------------------------------------------------------ |
| **Super + ← / → / ↑ / ↓** | Mover foco entre ventanas (izq / der / arriba / abajo) |
| **Super + H / L / K / J** | Mover foco (equivalente a las flechas)                 |

---

## 🧱 Espacios de trabajo (Workspaces)

| Atajo                     | Acción                                             |
| ------------------------- | -------------------------------------------------- |
| **Super + [1–0]**         | Cambiar al workspace correspondiente               |
| **Super + Shift + [1–0]** | Mover ventana activa al workspace correspondiente  |
| **Super + S**             | Activar workspace especial “magic”                 |
| **Super + Shift + S**     | Mover ventana activa al workspace especial “magic” |
| **Super + Scroll Up**     | Ir al workspace anterior                           |
| **Super + Scroll Down**   | Ir al siguiente workspace                          |

---

## 🖱️ Gestos del ratón

| Atajo                                  | Acción                |
| -------------------------------------- | --------------------- |
| **Super + clic izquierdo (mouse:272)** | Mover ventana         |
| **Super + clic derecho (mouse:273)**   | Redimensionar ventana |

---

## 🔊 Multimedia

| Atajo                     | Acción                        |
| ------------------------- | ----------------------------- |
| **XF86AudioRaiseVolume**  | Subir volumen (+5%)           |
| **XF86AudioLowerVolume**  | Bajar volumen (-5%)           |
| **XF86AudioMute**         | Silenciar / activar sonido    |
| **XF86AudioMicMute**      | Silenciar / activar micrófono |
| **XF86AudioNext**         | Siguiente pista (playerctl)   |
| **XF86AudioPrev**         | Pista anterior                |
| **XF86AudioPlay / Pause** | Reproducir / pausar           |

---

## 💡 Brillo

| Atajo                     | Acción             |
| ------------------------- | ------------------ |
| **XF86MonBrightnessUp**   | Subir brillo (+5%) |
| **XF86MonBrightnessDown** | Bajar brillo (-5%) |

*(Tienes dos versiones: una normal y otra con `bindel` que usa `brightnessctl -e4 -n2` para mejor compatibilidad.)*

## 💬 Resumen total

Existen **41 atajos activos**.

---

## ⚙️ Comandos básicos dentro de Kitty

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

---

- muchos atajos de Bash funcionan igual en Zsh,

- pero **Zsh añade algunos más potentes y personalizables**.

---

### ⚡ Atajos básicos (idénticos a Bash)

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

---

## Bash  y zsh Comandos

---

### ⚙️ Atajos especiales de Zsh (ZLE)

| Atajo                | Acción                                                                     |
| -------------------- | -------------------------------------------------------------------------- |
| `Ctrl + X, Ctrl + E` | Edita el comando actual en tu editor ($EDITOR, por defecto *nano* o *vim*) |
| `Ctrl + X, Ctrl + U` | Deshacer cambios en la línea                                               |
| `Alt + .`            | Inserta el último argumento del comando anterior                           |
| `Esc + /`            | Autocompleta desde el historial                                            |
| `Ctrl + X, *`        | Expande un patrón tipo `*.txt` directamente                                |
| `Ctrl + X, Q`        | Cita (escapa) caracteres especiales automáticamente                        |

---

### 🧠 Si usas Oh My Zsh o Powerlevel10k

Puedes tener **atajos extra**, como:

- `Alt + ↑` / `Alt + ↓` → navegar por comandos anteriores que empiezan igual.
- `Ctrl + Space` → autocompletado avanzado (si lo activas).
- `Ctrl + G` → cancelar búsqueda interactiva del historial.

---

### 🧩 Ver o personalizar los atajos

Puedes listar todos los atajos activos con:

```bash
bindkey
```

Y reasignar uno, por ejemplo:

```bash
bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history
```

---

[Regresar a la guía principal](./readme.md#hyprdots)

> **Autor:** Fravelz
