# TermuXpert User Guide

## Table of Contents
1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Getting Started](#getting-started)
4. [Features](#features)
   - [System Information](#system-information)
   - [Package Management](#package-management)
   - [Backup and Restore](#backup-and-restore)
   - [System Monitoring](#system-monitoring)
   - [Network Tools](#network-tools)
   - [Termux Customization](#termux-customization)
   - [Development Environment Setup](#development-environment-setup)
   - [Security Tools](#security-tools)
   - [Productivity Tools](#productivity-tools)
5. [Configuration](#configuration)
6. [Troubleshooting](#troubleshooting)
7. [Updating TermuXpert](#updating-termuxpert)
8. [Uninstalling TermuXpert](#uninstalling-termuxpert)

## Introduction

TermuXpert is an advanced Termux management tool that provides a suite of utilities to enhance your Termux experience. It offers features for system management, development, security, and productivity.

## Installation

To install TermuXpert, follow these steps:

1. Open Termux on your Android device.
2. Run the following commands:

   ```bash
   curl -O https://raw.githubusercontent.com/yourusername/termuxpert/main/install.sh
   chmod +x install.sh
   ./install.sh
   ```

3. Follow the on-screen prompts to complete the installation.

## Getting Started

After installation, you can start TermuXpert by running:

```bash
termuxpert
```

This will open the main menu, where you can access all the features of TermuXpert.

## Features

### System Information

Displays detailed information about your Termux and Android system, including:
- Termux version
- Android version
- Device model
- CPU architecture
- Total RAM
- Available storage

### Package Management

Allows you to manage Termux packages:
- Update package lists
- Upgrade installed packages
- Install new packages
- Remove packages
- Search for packages

### Backup and Restore

Provides options to backup and restore your Termux environment:
- Create full system backups
- Restore from previous backups
- Manage backup files

### System Monitoring

Monitors system resources in real-time:
- CPU usage
- Memory usage
- Disk usage
- Network statistics

### Network Tools

Offers various network-related utilities:
- Check IP address
- Ping hosts
- Perform DNS lookups
- Scan ports
- Run network speed tests
- Perform traceroutes

### Termux Customization

Customize your Termux environment:
- Install Zsh and Oh My Zsh
- Set custom color schemes
- Configure extra keys
- Customize Bash, Vim, and Tmux configurations

### Development Environment Setup

Set up development environments for various programming languages:
- Python
- Node.js
- Git
- C/C++
- Ruby and Rails
- Java

### Security Tools

Enhance the security of your Termux environment:
- Generate SSH keys
- Set up two-factor authentication
- Encrypt and decrypt files
- Scan for open ports

### Productivity Tools

Boost your productivity with various tools:
- Task manager (TaskWarrior)
- Note-taking
- Reminders
- Pomodoro timer
- Calculator

## Configuration

You can customize TermuXpert by modifying the configuration files in the `~/.termuxpert/config/` directory:

- `colors.properties`: Customize Termux color scheme
- `termux.properties`: Adjust Termux-specific settings
- `bashrc.custom`: Customize Bash configuration
- `vimrc.custom`: Customize Vim configuration
- `tmux.conf.custom`: Customize Tmux configuration

## Troubleshooting

If you encounter any issues:

1. Ensure Termux is up to date: `pkg update && pkg upgrade`
2. Check the TermuXpert log file: `~/.termuxpert/logs/termuxpert.log`
3. If the issue persists, please report it on the GitHub issues page.

## Updating TermuXpert

To update TermuXpert to the latest version:

```bash
cd ~/termuxpert
./update.sh
```

## Uninstalling TermuXpert

If you wish to uninstall TermuXpert:

```bash
cd ~/termuxpert
./uninstall.sh
```

This will remove TermuXpert and all its components from your system.