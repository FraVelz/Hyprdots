#!/usr/bin/env bash

# Indica que el script debe ejecutarse con Bash, sin importar dónde esté instalado.

# ===========================
# CONFIGURACIÓN INICIAL
# ===========================
FONDOS_DIR="$HOME/.config/wallpapers"
THUMBS_DIR="$HOME/.config/wallpapers/.thumbs"
HYPR_CONF="$HOME/.config/hypr/hyprpaper.conf"      # Archivo de configuración de Hyprpaper.
THEME_PATH="$HOME/.config/bin/styles/wallpaper-switcher.rasi"  # Tema visual (estilo) usado por rofi.

# ===========================
# GENERAR MINIATURAS
# ===========================
mkdir -p "$THUMBS_DIR"  # Crea el directorio de miniaturas si no existe.

shopt -s nullglob  # Hace que el patrón *.jpg no devuelva literalmente "*.jpg" si no hay coincidencias.
for img in "$FONDOS_DIR"/*.{jpg,jpeg,png,JPG,JPEG,PNG,webp}; do
    [ -f "$img" ] || continue  # Salta si el archivo no existe (por si la carpeta está vacía).

    name=$(basename "$img")     # Nombre del archivo sin ruta (por ejemplo, fondo.jpg).
    thumb="$THUMBS_DIR/$name"   # Ruta donde se guardará la miniatura.

    if [ ! -f "$thumb" ]; then  # Si la miniatura no existe...
        # Usa ImageMagick para crear una miniatura de 300x200 centrada.
        if ! convert "$img" -resize 500x400^ -gravity center -extent 300x200 "$thumb" 2>/dev/null; then
            echo "Warning: no se pudo generar miniatura para: $img" >&2
            continue  # Si falla la conversión, muestra advertencia y sigue con la siguiente.
        fi
    fi
done

# ===========================
# CREAR LISTA PARA ROFI
# ===========================
# Cada línea del archivo contendrá: "Nombre\0icon\x1f/ruta/al/icono"
# Esto es el formato especial que usa rofi para mostrar iconos junto a texto.
OPTIONS_FILE=$(mktemp)  # Crea un archivo temporal donde se guardarán las opciones.
trap 'rm -f "$OPTIONS_FILE"' EXIT  # Elimina el archivo temporal al salir del script.

for img in "$FONDOS_DIR"/*; do
    [ -f "$img" ] || continue  # Ignora archivos inexistentes.
    name=$(basename "$img")     # Nombre base del archivo.
    thumb="$THUMBS_DIR/$name"   # Miniatura correspondiente.
    [ -f "$thumb" ] || thumb="$img"  # Si no hay miniatura, usa la imagen original como icono.
    
    # Escribe en el archivo: nombre + separadores especiales para rofi + icono.
    printf '%s\0icon\x1f%s\n' "$name" "$thumb" >> "$OPTIONS_FILE"
done

# ===========================
# SI NO HAY FONDOS, AVISAR
# ===========================
if [ ! -s "$OPTIONS_FILE" ]; then
    notify-send "Wallpaper switcher: No se encontraron imágenes en $FONDOS_DIR"
    exit 0
fi

# ===========================
# MOSTRAR MENÚ CON ROFI
# ===========================
# -dmenu → modo de menú simple
# -show-icons → muestra miniaturas
# -p → texto del prompt
# -theme → archivo .rasi del estilo personalizado
FONDO=$(cat "$OPTIONS_FILE" | rofi -dmenu -show-icons -p "🖼 Fondo:" -theme "$THEME_PATH")

# Si el usuario cierra rofi sin seleccionar nada, salir sin hacer nada.
[ -z "${FONDO:-}" ] && exit 0

# ===========================
# CAMBIAR EL FONDO
# ===========================
WALL="$FONDOS_DIR/$FONDO"
if [ ! -f "$WALL" ]; then
    notify-send "Wallpaper switcher Archivo no encontrado: $WALL"
    exit 1
fi

# Sobrescribe la configuración de hyprpaper con la nueva imagen seleccionada.
cat > "$HYPR_CONF" <<EOF
preload = $WALL
wallpaper = ,$WALL
EOF

# ===========================
# RECARGAR HYPRPAPER
# ===========================
killall hyprpaper 2>/dev/null || true  # Detiene cualquier instancia previa sin mostrar error si no existe.
hyprpaper & disown  # Inicia hyprpaper en segundo plano y lo separa del shell.

notify-send -i "$WALL Wallpaper cambiado $FONDO"

