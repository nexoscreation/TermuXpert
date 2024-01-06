#!/bin/bash

echo "Installing necessary tools for NinjaOS..."

# Example: Install essential packages
pkg install zsh -y
pkg install git -y
pkg install figlet toilet -y
pkg install ruby  -y
pkg install wget  -y
pkg install curl -y
gem install lolcat 

clear

cd ~/ninjaos-termux/themes/banner/ && cp -r 'ANSI Shadow.flf'  $PREFIX/share/figlet/ASCII-Shadow.flf 
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

# Additional installations or configurations can be added here

pkg install toilet figlet exa -y
cd ~/ninjaos-termux/config
rm -rf ~/.termux/colors.properties
rm -rf /data/data/com.termux/files/usr/etc/motd
cp -r .colors.properties ~/.termux/colors.properties
-r .termux.properties ~/.termux/termux.properties

clear
cd ~/ninjaos-termux ; bash ninjaos.sh
termux-open-url https://noscreator.pro

echo "Installation complete!"
