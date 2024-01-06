#!/bin/bash
clear;
echo "Installing necessary tools for NinjaOS..."
sleep 2
clear;
echo "Updating you system for NinjaOS..."
apt update && apt upgrade
clear;
echo "Installing Zsh for NinjaOS..."
pkg install zsh -y
clear;
echo "Installing git for NinjaOS..."
pkg install git -y
clear
echo "Installing Filget for NinjaOS..."
pkg install figlet toilet -y
clear
echo "Installing Ruby for NinjaOS..."
pkg install ruby  -y
clear
echo "Installing Wget for NinjaOS..."
pkg install wget  -y
clear
echo "Installing Curl for NinjaOS..."
pkg install curl -y
clear
echo "Installing Lolcat for NinjaOS..."
gem install lolcat 
clear
echo "Installing theme tools for NinjaOS..."
cd ~/ninjaos-termux/themes/banner/ && cp -r 'ANSI Shadow.flf'  $PREFIX/share/figlet/ASCII-Shadow.flf 
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
clear
echo "Additional installations for NinjaOS..."
pkg install toilet figlet exa -y
cd ~/ninjaos-termux/config
rm -rf ~/.termux/colors.properties
rm -rf /data/data/com.termux/files/usr/etc/motd
cp -r .colors.properties ~/.termux/colors.properties
-r .termux.properties ~/.termux/termux.properties
clear
echo "configurations can be added here"
cd ~/ninjaos-termux ; bash ninjaos.sh
termux-open-url https://noscreator.pro
echo "Installation complete!"
