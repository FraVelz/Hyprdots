# 🖥️ Guía de SDDM - Gestor de Inicio de Sesión

Esta guía explica cómo configurar y personalizar SDDM (Simple Desktop Display Manager) en Arch Linux.

---

## 📑 Contenido

1. [Ubicación de la Configuración](#ubicación-de-la-configuración)
2. [Cambiar el Tema](#cambiar-el-tema)
3. [Instalar Nuevos Temas](#instalar-nuevos-temas)
4. [Cambiar el Fondo](#cambiar-el-fondo)
5. [Personalizar Texto, Fuente y Colores](#personalizar-texto-fuente-y-colores)
6. [Probar Cambios sin Reiniciar](#probar-cambios-sin-reiniciar)
7. [Configurar Opciones Adicionales](#configurar-opciones-adicionales)
8. [Reiniciar para Aplicar Cambios](#reiniciar-para-aplicar-cambios)

---

## 📍 Ubicación de la Configuración

El archivo de configuración de SDDM está en:

```
/etc/sddm.conf
```

O, si no existe todavía, puedes generarlo así:

```bash
sudo sddm --example-config > /etc/sddm.conf
```

Luego puedes editarlo:

```bash
sudo nano /etc/sddm.conf
```

---

## 🎨 Cambiar el Tema

Los temas de SDDM se guardan en:

```
/usr/share/sddm/themes/
```

Para listar los temas instalados:

```bash
ls /usr/share/sddm/themes/
```

Te mostrará algo como:

```
breeze
breeze-dark
elarun
maldives
```

Luego, edita el archivo `/etc/sddm.conf` y busca o agrega la sección `[Theme]`:

```ini
[Theme]
Current=breeze-dark
CursorTheme=Breeze
```

Guarda y reinicia para aplicar los cambios.

---

## 📦 Instalar Nuevos Temas

Puedes instalar temas adicionales manualmente o desde AUR.

### Desde los Repositorios Oficiales (por ejemplo, temas de KDE):

```bash
sudo pacman -S sddm-kcm
```

Esto te permite configurarlo desde **Preferencias del sistema > Pantalla de inicio de sesión (SDDM)** en KDE.

### Desde AUR (manual):

Ejemplo:

```bash
yay -S sddm-theme-corners
```

Los temas se instalan en `/usr/share/sddm/themes/` y puedes activarlos editando el archivo `sddm.conf` como se mostró arriba.

---

## 🖼️ Cambiar el Fondo

Dentro de cada tema hay un archivo de configuración (generalmente `theme.conf` o `theme.conf.user`).

Por ejemplo, si usas `breeze`:

```
/usr/share/sddm/themes/breeze/theme.conf
```

Edita la línea:

```ini
Background=/usr/share/backgrounds/tu-fondo.jpg
```

Puedes copiar tu fondo personalizado a esa ruta o usar la ruta completa de tu imagen.

---

## 🎨 Personalizar Texto, Fuente y Colores

Dentro del mismo archivo `theme.conf` puedes ajustar:

```ini
Font=Sans Serif
FontSize=11
PrimaryColor=#ffffff
SecondaryColor=#00bcd4
```

Algunos temas usan QML, por lo que puedes modificar directamente los archivos `.qml` (si sabes algo de código QML/Qt Quick) para personalizar la posición de los elementos, sombras, etc.

---

## 🧪 Probar los Cambios sin Reiniciar

Puedes ejecutar SDDM en modo de prueba (sin cerrar tu sesión actual):

```bash
sddm-greeter --test-mode --theme /usr/share/sddm/themes/breeze-dark
```

Así ves los cambios sin reiniciar.

---

## ⚙️ Configurar Opciones Adicionales

### Autologin, Usuario por Defecto, Sesión Predeterminada

Edita `/etc/sddm.conf` y agrega:

```ini
[Autologin]
User=tu_usuario
Session=hyprland.desktop
```

🔹 Para saber el nombre exacto de tu sesión, revisa:

```
ls /usr/share/wayland-sessions/
```

Ejemplo: `hyprland.desktop`, `plasmawayland.desktop`, etc.

---

## 🔄 Reiniciar para Aplicar Todo

```bash
sudo systemctl restart sddm
```

O simplemente reinicia el sistema.

---

## 💡 Consejo Final

Si usas **Hyprland**, SDDM **no es la mejor opción** a largo plazo, porque:

* Está basado en **Qt5 y X11** (no nativo Wayland).
* Puede causar errores al iniciar sesiones Wayland (como doble cursor o bloqueo de pantalla).

👉 En ese caso, **Ly o greetd (con tuigreet o gtkgreet)** son más compatibles y ligeros.

---

**Autor:** Fravelz
