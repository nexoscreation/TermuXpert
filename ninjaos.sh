#!/bin/bash
# NinjaOS Installation Script
clear

# Function to display the NinjaOS logo with music
display_logo() {
    echo "NinjaOS Installation"
    # Add your ASCII art logo display command here
    cat << "EOF"
    ╔═╗─╔╦══╦═╗─╔╗─╔╦═══╦═══╦═══╗
    ║║╚╗║╠╣╠╣║╚╗║║─║║╔═╗║╔═╗║╔═╗║
    ║╔╗╚╝║║║║╔╗╚╝║─║║║─║║║─║║╚══╗
    ║║╚╗║║║║║║╚╗║╠╗║║╚═╝║║─║╠══╗║
    ║║─║║╠╣╠╣║─║║║╚╝║╔═╗║╚═╝║╚═╝║
    ╚╝─╚═╩══╩╝─╚═╩══╩╝─╚╩═══╩═══╝
EOF

if command -v play > /dev/null; then
echo -e "\n\033[1;96mMusic playback started in the background.\033[0m"
play ./data/1704523429064_track.mp3 &
else
echo -e "\n\033[1;96mMusic playback is not available. Skipping...\033[0m"
fi
sleep 20
clear
}

# Function to display the Featurastic NinjaOS banner
display_banner() {
echo -e "\033[1;36m╔════════════════════ NINJA OS ════════════════════╗"
echo ""
echo -e "\033[1;36m║                                                       ║"
echo ""
echo -e "\033[1;36m║                       Welcome!                        ║"
echo ""
echo -e "\033[1;36m║         Explore the Features with Ninja os!           ║"
echo ""
echo -e "\033[1;36m║                                                       ║"
echo ""
echo -e "\033[1;36m╚══════════════════════════════════════════════════╝"
echo ""
}

# Function to display Featurastic NinjaOS installation steps
installation_steps() {
echo "-----------------------------------------------------------"
echo ""
echo -e "\n\033[1;96mNinjaOS Installation Steps:\033[0m"
echo -e " \033[1;92m1. Prepare the Ninja Environment:\033[0m"
echo "    - Ensure a stable internet connection."
echo "    - Make sure your system meets the minimum requirements."

echo -e " \033[1;92m2. Download and Run the Featurastic Installer:\033[0m"
echo "    - Execute the following command in your terminal:"
echo "      \033[1;94m./featurastic_install.sh\033[0m"
echo "    - Follow the on-screen instructions to proceed."

echo -e " \033[1;92m3. Customize Your Featurastic NinjaOS:\033[0m"
echo "    - Explore the various configuration options in the settings."
echo "    - Personalize your shell, themes, and additional tools."

echo -e " \033[1;92m4. Enjoy Featurastic NinjaOS:\033[0m"
echo "    - Congratulations! Your Featurastic NinjaOS is ready to use."
echo -e "    - Visit \033[4mhttps://featurastic-ninjaos.com\033[0m for updates and support.\n"
}


# Function to display a footer
display_footer() {
echo "-----------------------------------------------------------"
echo -e "\033[1;36m╔════════════════════ NINJA OS ════════════════════╗"
echo -e "\033[1;36m║                                                       ║"
echo -e "\033[1;36m║     Thank you for choosing Featurastic NinjaOS!       ║"
echo -e "\033[1;36m║    Visit https://ninjaos.com for more information     ║"
echo -e "\033[1;36m║                                                       ║"
echo -e "\033[1;36m╚══════════════════════════════════════════════════╝"
echo ""  
}

# Main function to orchestrate the installation process
main() {
    display_logo
    display_banner
    installation_steps
    display_footer
}

# Run the main function
main
