#!/data/data/com.termux/files/usr/bin/bash

# TermuXpert Installation Script
# Author: Nexos Creation
# Version: 1.0.0
# Description: Installs TermuXpert with enhanced error handling, background processing, and validation

# Strict mode
set -euo pipefail
trap 'error_handler $? $LINENO $BASH_LINENO "$BASH_COMMAND" $(printf "::%s" ${FUNCNAME[@]:-})' ERR

# Color definitions
readonly COLOR_SUCCESS='\033[0;32m'
readonly COLOR_WARNING='\033[1;33m'
readonly COLOR_ERROR='\033[0;31m'
readonly COLOR_INFO='\033[0;34m'
readonly COLOR_RESET='\033[0m'

# Configuration
readonly GITHUB_REPO="nexoscreation/TermuXpert"
readonly REQUIRED_PACKAGES=(git curl wget jq)
readonly MIN_DISK_SPACE_MB=50
readonly SUPPORTED_ARCHITECTURES=("aarch64" "arm" "x86_64")
readonly INSTALL_DIR="$HOME/termuxpert"

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

# Spinner function
show_spinner() {
    local pid=$1
    local delay=0.1
    local spin_chars="|/-\\"

    while kill -0 $pid 2>/dev/null; do
        for char in $spin_chars; do
            printf "\r${COLOR_INFO}[INFO]${COLOR_RESET} Processing... $char"
            sleep $delay
        done
    done
    printf "\r${COLOR_SUCCESS}[SUCCESS]${COLOR_RESET} Task completed!     \n"
}

# System validation
validate_system() {
    log_info "Validating system requirements..."
    
    # Check Termux environment
    if [ ! -d "/data/data/com.termux" ]; then
        log_error "This script must be run in Termux"
        exit 1
    fi
    log_success "Termux Environment check passed"

    # Check architecture
    local arch
    arch=$(uname -m)
    if [[ ! " ${SUPPORTED_ARCHITECTURES[@]} " =~ " ${arch} " ]]; then
        log_error "Unsupported architecture: $arch"
        exit 1
    fi
    log_success "Architecture check passed: $arch"

    # Monitor system resources
    local available_space_mb
    available_space_mb=$(df "$HOME" | awk 'NR==2 {print $4 / 1024}')
    if (( available_space_mb < MIN_DISK_SPACE_MB )); then
        log_warning "Low disk space: Only ${available_space_mb}MB available. Recommended: ${MIN_DISK_SPACE_MB}MB."
    else
        log_success "Sufficient disk space available: ${available_space_mb}MB"
    fi

    log_success "System validation completed"
}

# Package management
install_dependencies() {
    log_info "Installing required packages in the background..."
    
    # Update package lists
    yes | pkg update -y &>/dev/null &
    local update_pid=$!
    show_spinner $update_pid
    
    # Install each required package
    for package in "${REQUIRED_PACKAGES[@]}"; do
        if ! command -v "$package" >/dev/null 2>&1; then
            log_info "Installing $package..."
            (yes | pkg install -y "$package" &>/dev/null) &
            local pkg_pid=$!
            show_spinner $pkg_pid
            log_success "$package installed successfully"
        else
            log_info "$package is already installed"
        fi
    done
}

# Installation process
perform_installation() {
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

post_install_summary() {
    echo -e "${COLOR_INFO}==============================="
    echo -e "  TermuXpert Installation Summary"
    echo -e "===============================${COLOR_RESET}"
    echo "Installed Directory: $INSTALL_DIR"
    echo "Symlink: $PREFIX/bin/termuxpert"
    echo "Version: 1.0.0"
    echo "Disk Space: $(df -h "$HOME" | awk 'NR==2 {print $4}') available"
    echo ""
    echo "Documentation: https://github.com/nexoscreation/TermuXpert"
    echo "Support: https://discord.gg/ejfxG2Qpjk"
    echo ""
    log_info "Thank you for using TermuXpert!"
}


# Main function
main() {
    clear
    echo -e "${COLOR_INFO}================================"
    echo -e "${COLOR_WARNING}  TermuXpert Installer v1.0.0   "
    echo -e "${COLOR_INFO}================================${COLOR_RESET}"

    validate_system

    install_dependencies &
    local dep_pid=$!
    show_spinner $dep_pid

    perform_installation &
    local install_pid=$!
    show_spinner $install_pid

    post_install_summary

    log_success "TermuXpert has been successfully installed!"
    log_info "You can now run 'termuxpert' from anywhere to start the tool."

    # Cleanup installer
    rm -f install.sh
}


# Execute main function
main
