#!/bin/bash

# ============================================================================
# MIGRATE THEMES - Script para migrar temas existentes a la nueva estructura
# ============================================================================
# Este script ayuda a convertir temas antiguos (con hyprland.conf completo)
# a la nueva estructura modular
# ============================================================================

THEMES_DIR="$HOME/.config/themes"
BACKUP_DIR="$HOME/.config/themes/.backup-$(date +%Y%m%d-%H%M%S)"

echo "🔄 Migración de Temas a Estructura Modular"
echo "============================================"
echo ""

# Crear directorio de backup
mkdir -p "$BACKUP_DIR"
echo "📦 Backup creado en: $BACKUP_DIR"
echo ""

# Contador
TOTAL=0
MIGRADOS=0
INDEPENDIENTES=0

for tema_dir in "$THEMES_DIR"/*; do
    if [ ! -d "$tema_dir" ]; then
        continue
    fi
    
    tema_nombre=$(basename "$tema_dir")
    
    # Saltar directorios especiales
    if [[ "$tema_nombre" == .* ]]; then
        continue
    fi
    
    TOTAL=$((TOTAL + 1))
    hypr_conf="$tema_dir/hypr/hyprland.conf"
    
    if [ -f "$hypr_conf" ]; then
        echo "📁 Procesando tema: $tema_nombre"
        
        # Detectar si es tema independiente (Windows10, etc.)
        # Por ahora, solo Windows10 se considera independiente
        if [[ "$tema_nombre" == "Windows10" ]]; then
            echo "   ✓ Tema independiente detectado (se mantiene como está)"
            INDEPENDIENTES=$((INDEPENDIENTES + 1))
            continue
        fi
        
        # Extraer solo la sección de colores si existe
        colors_conf="$tema_dir/hypr/colors.conf"
        
        if [ ! -f "$colors_conf" ]; then
            echo "   ⚠️  No se encontró colors.conf, extrayendo del hyprland.conf..."
            
            # Intentar extraer colores del hyprland.conf
            grep -E "^\$.*=.*rgba" "$hypr_conf" > "$colors_conf" 2>/dev/null || {
                echo "   ❌ No se pudieron extraer colores automáticamente"
                echo "   📝 Por favor, crea manualmente: $colors_conf"
            }
        fi
        
        # Crear theme-override.conf si hay diferencias en general/decoration
        override_conf="$tema_dir/hypr/theme-override.conf"
        if [ ! -f "$override_conf" ]; then
            # Extraer secciones específicas que pueden diferir
            {
                echo "# Override específico del tema: $tema_nombre"
                echo "# Generado automáticamente por migrate-themes.sh"
                echo ""
                
                # Extraer general si existe
                if grep -q "^general {" "$hypr_conf"; then
                    echo "# Configuración general del tema:"
                    sed -n '/^general {/,/^}/p' "$hypr_conf"
                    echo ""
                fi
                
                # Extraer decoration si existe
                if grep -q "^decoration {" "$hypr_conf"; then
                    echo "# Configuración de decoración del tema:"
                    sed -n '/^decoration {/,/^}/p' "$hypr_conf"
                    echo ""
                fi
            } > "$override_conf"
        fi
        
        # Hacer backup del hyprland.conf original
        cp "$hypr_conf" "$BACKUP_DIR/${tema_nombre}-hyprland.conf"
        
        # Crear un nuevo hyprland.conf mínimo que solo tenga lo esencial
        # (opcional: puedes eliminar el hyprland.conf del tema si quieres)
        echo "   ✓ Tema migrado a estructura modular"
        echo "   📝 hyprland.conf respaldado en: $BACKUP_DIR/${tema_nombre}-hyprland.conf"
        echo "   💡 Puedes eliminar $hypr_conf si el tema funciona correctamente"
        
        MIGRADOS=$((MIGRADOS + 1))
    else
        echo "📁 $tema_nombre: Ya está en formato modular ✓"
    fi
    
    echo ""
done

echo "============================================"
echo "✅ Migración completada"
echo "   Total de temas procesados: $TOTAL"
echo "   Temas migrados: $MIGRADOS"
echo "   Temas independientes: $INDEPENDIENTES"
echo ""
echo "📦 Backup guardado en: $BACKUP_DIR"
echo ""
echo "💡 Próximos pasos:"
echo "   1. Prueba cada tema con: ~/.config/rofi/theme-switcher.sh"
echo "   2. Si todo funciona, puedes eliminar los hyprland.conf de los temas"
echo "   3. Los backups están en: $BACKUP_DIR"
echo ""
