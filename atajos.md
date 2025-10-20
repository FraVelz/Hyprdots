Perfecto 🔥
He revisado todo tu archivo de configuración de **Hyprland**, y aquí tienes **todos los atajos de teclado (keybindings)** extraídos y ordenados por categorías, con una breve descripción de lo que hace cada uno.

---

## 🎮 **Modificadores principales**

* `$mainMod = SUPER` → tecla **Windows / Super**
* `$secondMod = SUPER_SHIFT` → **Windows + Shift**

---

## 🧩 **Gestión de ventanas**

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

## 🧠 **Menús personalizados**

| Atajo                      | Acción                                                       |
| -------------------------- | ------------------------------------------------------------ |
| **Super + D**              | Abrir lanzador de aplicaciones (`rofi -show drun`)           |
| **Super + Q**              | Abrir menú de apagado (`~/.config/bin/power-menu.sh`)        |
| **Super + A**              | Abrir cambiador de temas (`~/.config/bin/theme-switcher.sh`) |
| **Super + E**              | Menú de iconos (`~/.config/bin/menu-iconos.sh`)              |
| **Super + Shift + Return** | Activar “modo hacker” (`~/.config/bin/mode-hacker.sh`)       |

---

## 🧭 **Movimiento entre ventanas**

| Atajo                     | Acción                                                 |
| ------------------------- | ------------------------------------------------------ |
| **Super + ← / → / ↑ / ↓** | Mover foco entre ventanas (izq / der / arriba / abajo) |
| **Super + H / L / K / J** | Mover foco (equivalente a las flechas)                 |

---

## 🧱 **Espacios de trabajo (Workspaces)**

| Atajo                     | Acción                                             |
| ------------------------- | -------------------------------------------------- |
| **Super + [1–0]**         | Cambiar al workspace correspondiente               |
| **Super + Shift + [1–0]** | Mover ventana activa al workspace correspondiente  |
| **Super + S**             | Activar workspace especial “magic”                 |
| **Super + Shift + S**     | Mover ventana activa al workspace especial “magic” |
| **Super + Scroll Up**     | Ir al workspace anterior                           |
| **Super + Scroll Down**   | Ir al siguiente workspace                          |

---

## 🖱️ **Gestos del ratón**

| Atajo                                  | Acción                |
| -------------------------------------- | --------------------- |
| **Super + clic izquierdo (mouse:272)** | Mover ventana         |
| **Super + clic derecho (mouse:273)**   | Redimensionar ventana |

---

## 🔊 **Multimedia**

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

## 💡 **Brillo**

| Atajo                     | Acción             |
| ------------------------- | ------------------ |
| **XF86MonBrightnessUp**   | Subir brillo (+5%) |
| **XF86MonBrightnessDown** | Bajar brillo (-5%) |

*(Tienes dos versiones: una normal y otra con `bindel` que usa `brightnessctl -e4 -n2` para mejor compatibilidad.)*

## 💬 **Resumen total**

Existen **41 atajos activos**.












Perfecto 😎 estás hablando del **emulador de terminal Kitty**, ¿cierto?
(No del personaje 🐱).
Vamos con una guía completa de **comandos útiles y atajos de teclado** de **Kitty**, tanto para usarlo como para configurarlo.

---

## 🧠 ¿Qué es Kitty?

**Kitty** es un **emulador de terminal GPU-acelerado**, rápido, personalizable y compatible con funciones modernas (como pestañas, ventanas divididas y scripts).

---

## ⚙️ Comandos básicos dentro de Kitty

> Ojo: *“Comandos”* aquí se refiere a **atajos o funciones propias del terminal**, no a comandos de Linux (como `ls`, `cd`, etc.).

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

## 🧩 Comandos útiles en el archivo `kitty.conf`

(Generalmente en `~/.config/kitty/kitty.conf`)

```bash
# Cambiar fuente
font_family FiraCode Nerd Font
font_size 12.0

# Tema (colores)
include themes/Dracula.conf

# Transparencia
background_opacity 0.9

# Dividir pantalla
map ctrl+shift+enter launch --location=split

# Scroll suave
scrollback_lines 10000
```

Puedes crear o editar este archivo así:

```bash
nano ~/.config/kitty/kitty.conf
```

y luego recargar con:

```bash
kitty +kitten themes
```

o reiniciar Kitty.

---

## 🧰 Comandos “Kitten”

Kitty tiene pequeñas utilidades llamadas **kittens**, que extienden su funcionalidad.
Se usan así:

```bash
kitty +kitten <nombre>
```

Ejemplos:

| Comando                                | Función                                       |
| :------------------------------------- | :-------------------------------------------- |
| `kitty +kitten icat imagen.png`        | Muestra imágenes directamente en la terminal. |
| `kitty +kitten diff archivo1 archivo2` | Comparador de archivos.                       |
| `kitty +kitten ssh user@host`          | Conexión SSH mejorada.                        |
| `kitty +kitten clipboard`              | Copia/pega entre terminales.                  |
| `kitty +kitten hints`                  | Detecta URLs o archivos en pantalla.          |

---

## 💡 Tip: abrir Kitty en modo “remote”

Si usas varias sesiones, puedes ejecutarlo así:

```bash
kitty --session nombre_sesion.conf
```

Y tener una ventana con múltiples paneles/pestañas preconfigurados.

---


