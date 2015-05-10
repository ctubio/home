umask 002;

export EDITOR="/usr/bin/vim";

if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc";
    fi
fi

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH";
fi

TPUT=/usr/bin/tput;
START=`$TPUT hpa 0`;
UP=`$TPUT cuu1`;
BLINK='\e[5m'
black='\e[0;30m';
BLACK='\e[1;30m';
red='\e[0;31m';
RED='\e[1;31m';
green='\e[0;32m';
GREEN='\e[1;32m';
ORANGE='\e[0;33m';
YELLOW='\e[1;33m';
blue='\e[0;34m';
BLUE='\e[1;34m';
cyan='\e[0;36m';
CYAN='\e[1;36m';
grey='\e[0;37m';
WHITE='\e[1;37m';
bgBLACK='\e[40m';
bgWHITE='\e[47m';
NC='\e[0m';

if [ "$TERM" != "dumb" ]; then
  eval "`dircolors -b`";
  alias ls='ls -hF --color=auto';
fi

function promptdate () {
  echo -n -e "${NC}\n${ORANGE}[";
  echo -n `date +%H:%M:%S`;
  echo -n "] ";
}

function promptuptime () {
  echo -n -e "${green}";
  echo -n `uptime | sed -e "s/.*up//g"  -e "s/ [^\ ]* user.*//g" -e "s/,//g" -e "s/  / /"`;
  echo -n "";
}

function promptpwd () {
#        echo -n -e "${BLACK} ";
#        echo -n -e `dir | grep total | sed -e "s/total //g"`;
#        echo -n -e "\e[30;1;47m $PWD${YELLOW}";
#    if [ "$TERM" == "xterm" ]; then # only at tty[1~6]
#     echo -n -e "\e[?22;9c";
#    else
#     echo -n -e "\033]0;${USER}@${HOSTNAME}: ${PWD}\007";
#    fi
     echo -n -e "${RED} ${PWD}${YELLOW}";
}

function promptcursor () {
	echo -ne "\n ${WHITE}\$";
	echo -ne "${NC} ";
#	echo -ne "\e[?22;9c";
}

function promptbattery () {
	echo -ne " ${BLUE}`upower -i "$(upower -e | tail -n 1)" | grep percentage | cut -d :  -f 2 | sed -e "s/ *//"`";
}

PS1='$(promptdate)$(promptuptime)$(promptbattery)$(promptpwd)$(__git_ps1)$(promptcursor)';
PS2="\[\033[1;37m\] \$>\[\033[0m\]";
PS3="\[\033[1;37m\] \$:\[\033[0m\]";
PS4="\[\033[1;37m\] \$+\[\033[0m\]";

if [ "`wc -w < "$HOME/TODO"`" -ne "0" ]; then
  echo -e "\n${GREEN}Eeep!${YELLOW}";
  cat "$HOME/TODO" | sed "s/^/  /";
  echo -ne "${NC}";
else
  echo -e "\n${GREEN}Today, is a beautiful day.${NC}";
fi
