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
BLINK="\[\033[5m\]"
black="\[\033[0;30m\]";
BLACK="\[\033[1;30m\]";
red="\[\033[0;31m\]";
RED="\[\033[1;31m\]";
green="\[\033[0;32m\]";
GREEN="\[\033[1;32m\]";
ORANGE="\[\033[0;33m\]";
YELLOW="\[\033[1;33m\]";
blue="\[\033[0;34m\]";
BLUE="\[\033[1;34m\]";
cyan="\[\033[0;36m\]";
CYAN="\[\033[1;36m\]";
grey="\[\033[0;37m\]";
WHITE="\[\033[1;37m\]";
bgBLACK="\[\033[40m\]";
bgWHITE="\[\033[47m\]";
NC="\[\033[0m\]";
_NC='\e[0m';
_GREEN="\e[1;32m";
_YELLOW="\e[1;33m";

if [ "$TERM" != "dumb" ]; then
  eval "`dircolors -b`";
  alias ls='ls -hF --color=auto';
fi

function promptdate () {
  echo -n -e "${NC}\n${ORANGE}[";
  echo -n '`date +%H:%M:%S`';
  echo -n "]";
}

function promptuptime () {
  echo -n -e "${BLUE} ${HOSTNAME}${green}";
  echo -n '`uptime | sed -e "s/.*up//g"  -e "s/ [^\ ]* user.*//g" -e "s/,//g" -e "s/  / /"`';
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
     echo -n -e "${RED}\${PWD}${YELLOW}";
}

function promptcursor () {
	echo -ne "\n ${WHITE}\$";
	echo -ne "${NC} ";
#	echo -ne "\e[?22;9c";
}

function promptbattery () {
	upower -v >/dev/null 2>&1 && echo -ne " ${BLUE}`upower -i "$(upower -e | tail -n 1)" | grep percentage | cut -d :  -f 2 | sed -e "s/ *//"`";
}

PS1="$(promptdate)$(promptuptime)$(promptbattery)$(promptpwd)\$(__git_ps1)$(promptcursor)";
PS2="\[\033[1;37m\] \$>\[\033[0m\]";
PS3="\[\033[1;37m\] \$:\[\033[0m\]";
PS4="\[\033[1;37m\] \$+\[\033[0m\]";

if [ "`wc -w < "$HOME/TODO"`" -ne "0" ]; then
  echo -e "\n${_GREEN}Eeep!${_YELLOW}";
  cat "$HOME/TODO" | sed "s/^/  /";
  echo -ne "${_NC}";
else
  echo -e "\n${_GREEN}Today, is a beautiful day.${_NC}";
fi
