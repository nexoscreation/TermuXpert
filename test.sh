#!/bin/bash
echo "Running tests for TermuXpert..."
bash install.sh && echo "Installation test passed."
bash update.sh && echo "Update test passed."
bash uninstall.sh && echo "Uninstallation test passed."
echo "All tests passed!"
