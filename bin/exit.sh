#!/bin/bash
clear;
# Colors
CYAN='\033[0;36m'
PINK='\033[1;35m'                                                                        
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color                                                                                                                                                           # NinjaOS Installation Script


# Function to display a footer
display_footer() {
echo -e "${PINK}-----------------------------------------------------------${NC}"
echo -e "${CYAN}╔════════════════════ ${GREEN}NINJA OS${CYAN} ════════════════════╗${NC}"
echo -e "${CYAN}║                                                  ║${NC}"
echo -e "${CYAN}║  Thank you for choosing Featurastic NinjaOS!     ║${NC}"
echo -e "${CYAN}║ Visit https://ninjaos.com for more information   ║${NC}"
echo -e "${CYAN}║                                                  ║${NC}"
echo -e "${CYAN}╚══════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${GREEN}Saving Changes...${NC}"
sleep 4
echo -e "${GREEN}Shutdowing System...${NC}"
sleep 4
clear
exit
}

# Main function to orchestrate the installation process
main() {
    display_footer
}

# Run the main function
main
