#!/bin/bash
clear;

# NinjaOS Zsh Setup Script
rm -rf ~/.zshrc
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s zsh
cd ~/ninjaos-termux ; bash ninjaos.sh
