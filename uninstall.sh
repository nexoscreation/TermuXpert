#!/data/data/com.termux/files/usr/bin/bash

# TermuXpert Uninstall Script
# Version: 1.0.0
# Description: Safely removes TermuXpert and its configurations

# Strict mode
set -euo pipefail
trap 'error_handler $? $LINENO "$BASH_COMMAND"' ERR

# Color definitions
readonly COLOR_SUCCESS='\033[0;32m'
readonly COLOR_WARNING='\033[1;33m'
readonly COLOR_ERROR='\033[0;31m'
readonly COLOR_INFO='\033[0;34m'
readonly COLOR_RESET='\033[0m'

# Configuration
readonly CONFIG_FILE="$HOME/.termuxpert_config"
readonly BACKUP_DIR="$HOME/termuxpert_backup_$(date +%Y%m%d_%H%M%S)"

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
    exit "$exit_code"
}

# Backup function
create_backup() {
    if [ -d "$INSTALL_DIR" ]; then
        log_info "Creating backup at $BACKUP_DIR..."
        mkdir -p "$BACKUP_DIR"
        cp -r "$INSTALL_DIR"/* "$BACKUP_DIR/" 2>/dev/null || true
        cp "$CONFIG_FILE" "$BACKUP_DIR/" 2>/dev/null || true
        log_success "Backup created successfully"
    else
        log_warning "No installation directory found to back up"
    fi
}

# Validation
validate_installation() {
    if [ ! -f "$CONFIG_FILE" ]; then
        log_error "TermuXpert configuration file not found"
        exit 1
    fi

    source "$CONFIG_FILE"

    if [ ! -d "$INSTALL_DIR" ]; then
        log_error "TermuXpert installation directory not found"
        exit 1
    fi

    log_success "TermuXpert installation validation passed"
}

# Uninstallation process
perform_uninstallation() {
    # Remove symlink
    log_info "Removing symlink..."
    if rm -f "$PREFIX/bin/termuxpert"; then
        log_success "Symlink removed successfully"
    else
        log_warning "Failed to remove symlink"
    fi

    # Remove installation directory
    log_info "Removing TermuXpert directory..."
    if rm -rf "$INSTALL_DIR"; then
        log_success "Installation directory removed successfully"
    else
        log_warning "Failed to remove installation directory"
    fi

    # Remove configuration
    log_info "Removing configuration file..."
    if rm -f "$CONFIG_FILE"; then
        log_success "Configuration file removed successfully"
    else
        log_warning "Failed to remove configuration file"
    fi

    # Remove remaining files
    log_info "Cleaning up remaining files..."
    rm -f "$HOME/.termuxpert_history" 2>/dev/null || true
    rm -rf "$HOME/.termuxpert_cache" 2>/dev/null || true
    log_info "Cleanup completed"
}

# Main uninstallation process
main() {
    clear
    echo -e "${COLOR_INFO}================================"
    echo -e "${COLOR_WARNING}  TermuXpert Uninstaller v1.0.0  "
    echo -e "${COLOR_INFO}================================${COLOR_RESET}"

    validate_installation

    # Confirmation prompt for uninstallation
    log_warning "Are you sure you want to uninstall TermuXpert? (y/N)"
    read -r confirm
    if [[ ! $confirm =~ ^[Yy]$ ]]; then
        log_info "Uninstallation cancelled"
        exit 0
    fi

    # Backup prompt
    log_warning "Would you like to create a backup before uninstalling? (Y/n)"
    read -r backup_confirm
    if [[ ! $backup_confirm =~ ^[Nn]$ ]]; then
        create_backup
    fi

    # Perform uninstallation
    perform_uninstallation

    log_success "TermuXpert has been successfully uninstalled"
    if [ -d "$BACKUP_DIR" ]; then
        log_info "Your backup is available at: $BACKUP_DIR"
    fi
    log_info "Thank you for using TermuXpert!"
}

# Execute main function
main