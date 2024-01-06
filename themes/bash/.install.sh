#!/usr/bin/bash
git clone https://github.com/zsh-users/zsh-autosuggestions /data/data/com.termux/files/home/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /data/data/com.termux/files/home/.oh-my-zsh/plugins/zsh-syntax-highlighting

clear
PUT(){ echo -en "\033[${1};${2}H";}
clear;toilet -t -f mono12  "THEME" --gay -F border
echo ""
PUT 11 40
echo -e "\e[92mBy\e[1;93m Nos Creator\e[1;95m /\e[1;96m NOSCREATOR0 "
PUT 12 3
echo ""
echo -e "\e[101;1;39mNOTE\e[0;1;33m Use upto 9 words\e[0m"
echo ""
cd ~/ninjaos-termux/themes/bash
echo -e '\e[1;96m'
read -p '  Type Banner Name ❯ ' name
sed -e "s/\PROC/$name/g" .installzshrc > $HOME/.zshrc
echo  ""
echo -e '\e[1;96m'
read -p '  Type Shell Name ❯ ' name
sed -e "s/\NOSCREATOR/$name/g" .ninjaos.zsh-theme > $HOME/.oh-my-zsh/themes/ninjaos.zsh-theme
