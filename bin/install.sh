#!/bin/bash
clear;
echo "--Installing necessary tools--
sleep 1
clear;
echo "--Updating you system--
apt update && apt upgrade
clear;
echo "--Installing Zsh--
pkg install zsh -y
clear;
echo "--Installing git--
pkg install git -y
clear
echo "--Installing Filget--
pkg install figlet toilet -y
clear
echo "--Installing Ruby--
pkg install ruby  -y
clear
echo "--Installing Wget--
pkg install wget  -y
clear
echo "--Installing Curl--
pkg install curl -y
clear
echo "--Installing Lolcat--
gem install lolcat 
clear
echo "--Installing theme tools--
cd ~/ninjaos-termux/themes/banner/ && cp -r 'ANSI Shadow.flf'  $PREFIX/share/figlet/ASCII-Shadow.flf 
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
clear
echo "--Additional installations--
pkg install toilet figlet exa -y
cd ~/ninjaos-termux/config
rm -rf ~/.termux/colors.properties
rm -rf /data/data/com.termux/files/usr/etc/motd
cp -r .colors.properties ~/.termux/colors.properties
-r .termux.properties ~/.termux/termux.properties
clear
termux-open-url https://noscreator.pro
echo "Thank you for installing!"
echo "Rebooting Your System!"
sleep 1
clear
cd ~/ninjaos-termux ; bash ninjaos.sh
