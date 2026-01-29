#!/bin/bash

# ============================================================================
# Script para obtener permisos de configuración de Hyprdots
# ============================================================================
# Este script cambia los permisos de los directorios de configuración
# para que pertenezcan al usuario actual en lugar de root.
# ============================================================================

set -euo pipefail  # Salir en error, variables no definidas, pipefail

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Funciones de utilidad
print_header() {
    echo ""
    echo -e "${BLUE}============================================================${NC}"
    echo -e "${BLUE}  $1${NC}"
    echo -e "${BLUE}============================================================${NC}"
    echo ""
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}" >&2
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

# Detectar usuario actual
CURRENT_USER="${SUDO_USER:-$USER}"
if [ "$EUID" -eq 0 ] && [ -z "${SUDO_USER:-}" ]; then
    CURRENT_USER="$USER"
fi

# Detectar ruta del repositorio automáticamente
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$SCRIPT_DIR"

print_header "Hyprdots - Gestor de Permisos"
print_info "Usuario actual: $CURRENT_USER"
print_info "Repositorio: $REPO_DIR"
echo ""

# Verificar que estamos en el directorio correcto
if [ ! -d "$REPO_DIR/config" ]; then
    print_error "No se encontró el directorio 'config' en: $REPO_DIR"
    print_info "Asegúrate de ejecutar este script desde el directorio del repositorio"
    exit 1
fi

# Verificar permisos de sudo
if [ "$EUID" -ne 0 ]; then
    print_warning "Este script requiere permisos de administrador"
    print_info "Ejecutando con sudo..."
    exec sudo "$0" "$@"
fi

# Lista de directorios de configuración a procesar
CONFIG_DIRS=(
    "hypr"
    "themes"
    "rofi"
    "waybar"
    "nvim"
    "kitty"
    "wallpapers"
    "fastfetch"
    "ranger"
)

# Directorio base de configuración
CONFIG_BASE="$HOME/.config"

# Contador de éxito/error
SUCCESS_COUNT=0
ERROR_COUNT=0
SKIP_COUNT=0

print_header "Obteniendo Permisos de ~/.config"

# Procesar cada directorio
for dir in "${CONFIG_DIRS[@]}"; do
    target_dir="$CONFIG_BASE/$dir"
    
    if [ ! -e "$target_dir" ]; then
        print_warning "$dir no existe, se omitirá"
        SKIP_COUNT=$((SKIP_COUNT + 1))
        continue
    fi
    
    print_info "Procesando: $dir"
    
    if chown -R "$CURRENT_USER:$CURRENT_USER" "$target_dir" 2>/dev/null; then
        print_success "$dir - Permisos actualizados"
        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    else
        print_error "$dir - Error al actualizar permisos"
        ERROR_COUNT=$((ERROR_COUNT + 1))
    fi
done

# Procesar scripts en rofi si existen
ROFI_SCRIPTS_DIR="$CONFIG_BASE/rofi"
if [ -d "$ROFI_SCRIPTS_DIR" ]; then
    print_info "Otorgando permisos de ejecución a scripts de rofi..."
    find "$ROFI_SCRIPTS_DIR" -type f -name "*.sh" -exec chmod +x {} \; 2>/dev/null && {
        print_success "Scripts de rofi - Permisos de ejecución otorgados"
    } || {
        print_warning "Algunos scripts de rofi no pudieron recibir permisos de ejecución"
    }
fi

# Procesar scripts en scripts/ si existe
SCRIPTS_DIR="$CONFIG_BASE/scripts"
if [ -d "$SCRIPTS_DIR" ]; then
    print_info "Otorgando permisos de ejecución a scripts..."
    find "$SCRIPTS_DIR" -type f -name "*.sh" -exec chmod +x {} \; 2>/dev/null && {
        print_success "Scripts - Permisos de ejecución otorgados"
    } || {
        print_warning "Algunos scripts no pudieron recibir permisos de ejecución"
    }
fi

# Procesar scope.sh y scripts en ranger
RANGER_DIR="$CONFIG_BASE/ranger"
if [ -d "$RANGER_DIR" ]; then
    print_info "Otorgando permisos de ejecución a scope.sh (ranger)..."
    [ -f "$RANGER_DIR/scope.sh" ] && chmod +x "$RANGER_DIR/scope.sh" 2>/dev/null && {
        print_success "Ranger scope.sh - Permisos de ejecución otorgados"
    } || {
        print_warning "scope.sh no encontrado o no se pudieron aplicar permisos"
    }
fi

# Resumen final
echo ""
print_header "Resumen"
echo -e "  ${GREEN}✅ Exitosos:${NC} $SUCCESS_COUNT"
echo -e "  ${RED}❌ Errores:${NC} $ERROR_COUNT"
echo -e "  ${YELLOW}⏭️  Omitidos:${NC} $SKIP_COUNT"
echo ""

if [ $ERROR_COUNT -eq 0 ]; then
    print_success "¡Permisos obtenidos correctamente!"
    exit 0
else
    print_error "Se encontraron $ERROR_COUNT errores al obtener permisos"
    exit 1
fi

# Autor: Fravelz
