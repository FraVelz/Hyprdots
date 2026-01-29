#!/bin/bash

# ============================================================================
# Script para renombrar wallpapers con nombres más descriptivos
# ============================================================================

set -uo pipefail

WALLPAPERS_DIR="$HOME/Documentos/others/Hyprdots/config/wallpapers"
cd "$WALLPAPERS_DIR" || exit 1

echo "🖼️  Renombrando wallpapers con nombres más descriptivos..."
echo ""

renamed=0
skipped=0

# Función para renombrar un archivo
rename_file() {
    local old_name="$1"
    local new_name="$2"
    
    if [ ! -f "$old_name" ]; then
        return 1  # Archivo no existe, continuar
    fi
    
    if [ -f "$new_name" ]; then
        echo "⚠️  Ya existe: $new_name (omitiendo $old_name)"
        ((skipped++))
        return 1
    fi
    
    if mv "$old_name" "$new_name" 2>/dev/null; then
        echo "✅ $old_name -> $new_name"
        ((renamed++))
        return 0
    else
        echo "❌ Error al renombrar: $old_name"
        return 1
    fi
}

# Archivos numericos y UUIDs
rename_file "1006255.webp" "abstract-colorful-1.webp"
rename_file "1010049.webp" "abstract-colorful-2.webp"
rename_file "1067269.webp" "abstract-colorful-3.webp"
rename_file "2976631.webp" "abstract-colorful-4.webp"
rename_file "5eb3ff53-1d0e-482b-bff2-805f537d7ddd.webp" "abstract-geometric-1.webp"
rename_file "7a9cc0df182544a11b5d5aef9739ee635a70277f.webp" "abstract-geometric-2.webp"

# Archivos con nombres descriptivos pero mejorables
rename_file "1920x1080_hack4u_logo.webp" "hack4u-logo.webp"
rename_file "2560x1600-battlestation-computer.webp" "battlestation-computer.webp"
rename_file "anime-verde-mujer.webp" "anime-green-woman.webp"
rename_file "anime.jpg" "anime-style-1.jpg"
rename_file "arch-ascii.webp" "arch-linux-ascii-art.webp"
rename_file "arch_new.webp" "arch-linux-new.webp"
rename_file "archlinux.webp" "arch-linux-logo.webp"
rename_file "Arch-red.webp" "arch-linux-red.webp"
rename_file "ApusColors2.webp" "apus-colors-2.webp"
rename_file "Art-Wallpaper-32.webp" "art-wallpaper-32.webp"
rename_file "asgh.webp" "abstract-shapes-1.webp"
rename_file "backiee-174999-landscape.webp" "landscape-mountains.webp"
rename_file "batman-1.jpg" "batman-dark-1.jpg"
rename_file "batman-2.jpg" "batman-dark-2.jpg"
rename_file "blackarch-92ed3-wallpapers-af916-wallpaper-381a8-cave.webp" "blackarch-cave.webp"
rename_file "BloodJungles.webp" "blood-jungles.webp"
rename_file "city.webp" "futuristic-city.webp"
rename_file "ciudad-futuristica-1.webp" "futuristic-city-1.webp"
rename_file "ciudad-futuristica-cyberpunk-pixel-art.webp" "cyberpunk-pixel-city.webp"
rename_file "Circuit.webp" "circuit-board.webp"
rename_file "desktop-wallpaper-1080--black-and-blue-abstract.webp" "abstract-black-blue.webp"
rename_file "dominik-mayer-10.webp" "abstract-art-1.webp"
rename_file "Dr460nized_Honeycomb.webp" "honeycomb-pattern.webp"
rename_file "dsfgafdhjyk.webp" "abstract-1.webp"
rename_file "fotor-ai-20231209145710.webp" "ai-generated-art.webp"
rename_file "Garuda_TilliDie_2.webp" "garuda-linux-2.webp"
rename_file "Ghosts.webp" "ghosts-pattern.webp"
rename_file "hacker-fsociety.webp" "hacker-fsociety.webp"
rename_file "hacker2.webp" "hacker-style-2.webp"
rename_file "hackerpurple.webp" "hacker-purple.webp"
rename_file "hackthebox2.webp" "hackthebox-logo.webp"
rename_file "ign_batman.webp" "batman-ign.webp"
rename_file "image.webp" "placeholder.webp"
rename_file "IMG_20230429_135640_767.webp" "photo-2023-04-29.webp"
rename_file "IMG_20231017_011854_995.webp" "photo-2023-10-17-1.webp"
rename_file "IMG_20231017_012334.webp" "photo-2023-10-17-2.webp"
rename_file "Metall_SGS.webp" "metallic-pattern.webp"
rename_file "monster-anime.jpg" "anime-monster.jpg"
rename_file "neon.webp" "neon-lights-1.webp"
rename_file "neon3.webp" "neon-lights-3.webp"
rename_file "p.webp" "abstract-pattern.webp"
rename_file "parrot.webp" "parrot-os-logo.webp"
rename_file "pixel-jeff-version2.webp" "pixel-art-jeff-2.webp"
rename_file "red_arch_2.webp" "arch-linux-red-2.webp"
rename_file "Red_Booster_TilliDie.webp" "red-booster.webp"
rename_file "savitar-imagen-1.jpg" "savitar-character-1.jpg"
rename_file "shibainu.webp" "shiba-inu-dog.webp"
rename_file "snow_covered_mountains_under_black_cloudy_sky_4k_hd_black-1920x1080.webp" "snow-mountains-black-sky.webp"
rename_file "ssds.webp" "abstract-ssd.webp"
rename_file "Stripes.webp" "stripes-pattern.webp"
rename_file "superman.jpg" "superman-character.jpg"
rename_file "tree-seasons-black-7680x4320-11116.webp" "tree-seasons-black.webp"
rename_file "undefined_-_Imgur.webp" "imgur-upload.webp"
rename_file "uwp1259188.webp" "windows-uwp-style.webp"
rename_file "wallhaven-28rjj6.webp" "wallhaven-28rjj6.webp"
rename_file "wallhaven-3lwq86.webp" "wallhaven-3lwq86.webp"
rename_file "wallpaper-dark-montain.webp" "dark-mountain.webp"
rename_file "wallpaper-sword.webp" "sword-weapon.webp"
rename_file "wallpaper.webp" "default-wallpaper.webp"
rename_file "wallpaper_by_darkbrz.webp" "darkbrz-artwork.webp"
rename_file "wallpaperbetter.webp" "better-wallpaper.webp"
rename_file "win11_white.webp" "windows-11-white.webp"
rename_file "wp9250904-4k-wide-wallpapers.webp" "4k-wide-landscape.webp"
rename_file "xfce-blue.webp" "xfce-blue-theme.webp"
rename_file "anonimous.jpg" "anonymous-mask-1.jpg"
rename_file "anonimous2.jpg" "anonymous-mask-2.jpg"
rename_file "anonimous3.jpg" "anonymous-mask-3.jpg"
rename_file "anonimous4.jpg" "anonymous-mask-4.jpg"
rename_file "anonymus-glowing-gold-eyes-ei-1400x900.webp" "anonymous-gold-eyes.webp"

echo ""
echo "=========================================="
echo "✅ Renombrados: $renamed"
echo "⏭️  Omitidos: $skipped"
echo "=========================================="
echo ""
echo "💡 Los archivos han sido renombrados con nombres más descriptivos."
echo "   Usa guiones (-) en lugar de espacios para mejor compatibilidad."
