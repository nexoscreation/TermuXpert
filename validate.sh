#!/bin/bash
echo "Validating TermuXpert package..."
required_files=("install.sh" "update.sh" "uninstall.sh" "bin/termuxpert.sh")

for file in "${required_files[@]}"; do
    if [ ! -f "$file" ]; then
        echo "Error: Missing file $file"
        exit 1
    fi
done

echo "Validation successful!"
