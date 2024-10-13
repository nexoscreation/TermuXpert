#!/data/data/com.termux/files/usr/bin/bash

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
RESET='\033[0m'

echo -e "${YELLOW}TermuXpert Termux Optimization Script${RESET}"

# Clear package cache
echo -e "${GREEN}Clearing package cache...${RESET}"
pkg clean

# Remove unused packages
echo -e "${GREEN}Removing unused packages...${RESET}"
apt autoremove -y

# Optimize apt database
echo -e "${GREEN}Optimizing apt database...${RESET}"
apt-get autoclean
apt-get clean

# Clear app cache
echo -e "${GREEN}Clearing app cache...${RESET}"
rm -rf $HOME/.cache/*

# Optimize Termux home
echo -e "${GREEN}Optimizing Termux home...${RESET}"
rm -rf $HOME/.termux/boot

# Trim unused space
echo -e "${GREEN}Trimming unused space...${RESET}"
# fstrim -v /data

# Optimize bash history
echo -e "${GREEN}Optimizing bash history...${RESET}"
sed -i 's/^HISTSIZE=.*/HISTSIZE=1000/' $HOME/.bashrc
sed -i 's/^HISTFILESIZE=.*/HISTFILESIZE=2000/' $HOME/.bashrc

# Set up periodic optimization
echo -e "${GREEN}Setting up periodic optimization...${RESET}"
(crontab -l 2>/dev/null; echo "0 2 * * 0 $HOME/termuxpert/scripts/optimize_termux.sh") | crontab -

echo -e "${GREEN}Termux optimization completed successfully!${RESET}"
echo -e "${YELLOW}Note: A weekly cron job has been set up to run this optimization script.${RESET}"