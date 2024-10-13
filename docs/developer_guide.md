# TermuXpert Developer Guide

## Table of Contents
1. [Introduction](#introduction)
2. [Project Structure](#project-structure)
3. [Development Setup](#development-setup)
4. [Core Components](#core-components)
5. [Adding New Features](#adding-new-features)
6. [Modifying Existing Features](#modifying-existing-features)
7. [Testing](#testing)
8. [Documentation](#documentation)
9. [Contributing](#contributing)

## Introduction

This guide is intended for developers who want to contribute to or extend the TermuXpert project. It provides an overview of the project structure, development practices, and guidelines for adding or modifying features.

## Project Structure

The TermuXpert project is organized as follows:

```
termuxpert/
├── bin/                  # Core scripts
├── config/               # Configuration files
├── scripts/              # Utility scripts
├── tools/                # Additional tools
│   ├── termux-api/
│   ├── custom_commands/
│   └── automation/
├── docs/                 # Documentation
├── templates/            # Project templates
├── install.sh            # Installation script
├── update.sh             # Update script
├── uninstall.sh          # Uninstallation script
└── README.md             # Project readme
```

## Development Setup

1. Fork the TermuXpert repository on GitHub.
2. Clone your fork: `git clone https://github.com/nexoscreation/TermuXpert.git`
3. Create a new branch for your feature: `git checkout -b feature-name`
4. Install development dependencies: `pkg install shellcheck`

## Core Components

- `bin/termuxpert.sh`: Main entry point
- `bin/*.sh`: Individual feature scripts
- `scripts/*.sh`: Utility scripts
- `config/*`: Configuration files

## Adding New Features

To add a new feature to TermuXpert:

1. Create a new script in the `bin/` directory (e.g., `bin/new_feature.sh`).
2. Implement the feature using Bash scripting.
3. Add an option for the new feature in `bin/termuxpert.sh`.
4. Update the user guide in `docs/user_guide.md`.
5. If necessary, add configuration files to the `config/` directory.

Example of adding a new option in `bin/termuxpert.sh`:

```bash
case $choice in
    # ... existing options ...
    X) ./new_feature.sh ;;
    # ... other options ...
esac
```

## Modifying Existing Features

When modifying existing features:

1. Locate the relevant script in the `bin/` directory.
2. Make your changes, ensuring backwards compatibility if possible.
3. Update the user guide to reflect any changes in functionality or usage.
4. Test thoroughly to ensure no regressions.

## Testing

- Use `shellcheck` to lint your Bash scripts: `shellcheck bin/*.sh scripts/*.sh`
- Manually test all modified features on a Termux environment.
- Consider adding automated tests using a framework like `bats` (Bash Automated Testing System).

## Documentation

- Update `docs/user_guide.md` for any user-facing changes.
- Update this developer guide (`docs/developer_guide.md`) for any changes to the development process or project structure.
- Keep the `README.md` up to date with an overview of the project and its features.

## Contributing

1. Ensure your code adheres to the existing style and passes `shellcheck`.
2. Write clear, concise commit messages.
3. Push your changes to your fork.
4. Submit a pull request with a detailed description of your changes.

Thank you for contributing to TermuXpert!