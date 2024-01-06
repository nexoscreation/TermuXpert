clear;
echo -e "\e[1;37mWelcome to NinjaOS Termux!\e[0m"
echo -e "\e[1;37mCustomize your ninja environment.\e[0m"
echo -e "\e[1;37mType '\e[1;32mhelp\e[1;37m' for assistance.\e[0m"
echo "------------------------------"
echo " "

banner ( ) {
  printf ""
  echo -e "\e[1;31m  [\e[32m√\e[31m] \e[1;91m by \e[1;36mNos Creator\e[93m/ \e[100;92myoutube.com/noscreator\e[0m"
}
  
wr  ( )  {
  printf "\033[1;91m Invalid input!!!\n"
  selection
}

4line() {
  rm -rf ~/.zshrc
  cd ~/ninjaos-termux/banner
  bash  .install.sh
  clear ; cd ~/ninjaos-termux ; bash ninjaos.sh
}
 
5line() {
  cd ~/ninjaos-termux/bash
  bash .install.sh
  clear ; cd ~/ninjaos-termux ; bash ninjaos.sh
}

6line() {
  cd ~/ninjaos-termux/bash
  rm -rf ~/.zshrc
  chsh -s zsh
  bash .install.sh
  clear ; cd ~/ninjaos-termux ; bash ninjaos.sh
}

    
selection () {
  cd ~/ninjaos-termux
  echo -e -n "\e[1;96m Choose\e[1;96m Option : \e[0m"
  read a
  case $a in
  1) 1line ;;
  2) 2line ;;
  3) 3line ;;
  4) 4line ;;
  5) 5line ;;
  6) 6line ;;
  7) 7line ;;
  8) 8line ;;
  9) exit ;;
  *) wr ;;
  esac
}

menu () {
  banner
  printf "\n\033[1;91m[\033[0m1\033[1;91m]\033[1;92m Install Ninja OS \n"
  printf "\033[1;91m[\033[0m2\033[1;91m]\033[1;92m Install Zsh Shell\n"
  printf "\033[1;91m[\033[0m4\033[1;91m]\033[1;92m Install Bash Shell\n"
  printf "\033[1;91m[\033[0m5\033[1;91m]\033[1;92m Costomize Banner\n"
  printf "\033[1;91m[\033[0m6\033[1;91m]\033[1;92m Costomize Theme\n"
  printf "\033[1;91m[\033[0m7\033[1;91m]\033[1;92m Highlight / AutoSuggest\n"
  printf "\033[1;91m[\033[0m8\033[1;91m]\033[1;92m Update Ninja OS\n"
  printf "\033[1;91m[\033[0m8\033[1;91m]\033[1;92m Uninstall Ninja OS\n"
  printf "\033[1;91m[\033[0m9\033[1;91m]\033[1;92m Exit\n\n\n"
  selection
}

menu
