#!/data/data/com.termux/files/usr/bin/bash

# TermuXpert Installation Script
# Author: Nexos Creation
# Version: 1.0.0
# Description: Installs TermuXpert with enhanced error handling and validation

# Strict mode
set -euo pipefail
trap 'error_handler $? $LINENO $BASH_LINENO "$BASH_COMMAND" $(printf "::%s" ${FUNCNAME[@]:-})' ERR

# Color definitions with better naming
readonly COLOR_SUCCESS='\033[0;32m'
readonly COLOR_WARNING='\033[1;33m'
readonly COLOR_ERROR='\033[0;31m'
readonly COLOR_INFO='\033[0;34m'
readonly COLOR_RESET='\033[0m'

# Configuration
readonly GITHUB_REPO="nexoscreation/TermuXpert"
readonly MIN_STORAGE_MB=100
readonly REQUIRED_PACKAGES=(git curl wget jq)

# Logging functions
log_info() { echo -e "${COLOR_INFO}[INFO]${COLOR_RESET} $1"; }
log_success() { echo -e "${COLOR_SUCCESS}[SUCCESS]${COLOR_RESET} $1"; }
log_warning() { echo -e "${COLOR_WARNING}[WARNING]${COLOR_RESET} $1"; }
log_error() { echo -e "${COLOR_ERROR}[ERROR]${COLOR_RESET} $1"; }

# Error handler
error_handler() {
    local exit_code=$1
    local line_no=$2
    log_error "Error on line $line_no: Command failed with exit code $exit_code"
    cleanup_on_error
    exit "$exit_code"
}

# Cleanup function
cleanup_on_error() {
    log_warning "Performing cleanup after error..."
    if [ -d "$INSTALL_DIR" ]; then
        rm -rf "$INSTALL_DIR"
    fi
}

# System validation
validate_system() {
    log_info "Validating system requirements..."
    
    # Check Termux environment
    if [ ! -d "/data/data/com.termux" ]; then
        log_error "This script must be run in Termux"
        exit 1
    fi
    
    # Check available storage
    local available_storage
    available_storage=$(df -m "$HOME" | awk 'NR==2 {print $4}')
    if [ "$available_storage" -lt "$MIN_STORAGE_MB" ]; then
        log_error "Insufficient storage space. Need at least ${MIN_STORAGE_MB}MB"
        exit 1
    fi
}

# Package management
install_dependencies() {
    log_info "Installing required packages..."
    
    pkg update -y || {
        log_error "Failed to update package lists"
        exit 1
    }
    
    for package in "${REQUIRED_PACKAGES[@]}"; do
        if ! command -v "$package" >/dev/null 2>&1; then
            log_info "Installing $package..."
            pkg install -y "$package" || {
                log_error "Failed to install $package"
                exit 1
            }
        fi
    done
}

# Installation
perform_installation() {
    local INSTALL_DIR="$HOME/termuxpert"
    
    # Create installation directory
    log_info "Creating installation directory..."
    mkdir -p "$INSTALL_DIR" || {
        log_error "Failed to create installation directory"
        exit 1
    }
    
    # Clone repository
    log_info "Cloning TermuXpert repository..."
    git clone "https://github.com/${GITHUB_REPO}.git" "$INSTALL_DIR" || {
        log_error "Failed to clone repository"
        cleanup_on_error
        exit 1
    }
    
    # Set permissions
    log_info "Setting permissions..."
    chmod +x "$INSTALL_DIR/bin"/*.sh "$INSTALL_DIR"/*.sh
    
    # Create symlink
    log_info "Creating symlink..."
    ln -sf "$INSTALL_DIR/bin/termuxpert.sh" "$PREFIX/bin/termuxpert"
    
    # Create configuration
    log_info "Creating configuration..."
    cat > "$HOME/.termuxpert_config" <<EOF
INSTALL_DIR="$INSTALL_DIR"
VERSION="1.0.0"
LAST_UPDATE="$(date +%s)"
EOF
}

# Main installation process
main() {
    clear
    echo -e "${COLOR_INFO}================================"
    echo -e "${COLOR_WARNING}  TermuXpert Installer v1.0.0   "
    echo -e "${COLOR_INFO}================================${COLOR_RESET}"
    
    validate_system 
    install_dependencies
    perform_installation
    
    log_success "TermuXpert has been successfully installed!"
    log_info "You can now run 'termuxpert' from anywhere to start the tool."
    
    # Cleanup installer
    rm -f install.sh
}

# Execute main function
main