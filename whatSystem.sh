#!/bin/bash

# whatSystem.sh v1.0

# [*] Author - an4kin (Sergio Busquiel Villar)



#Colours
green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
purple="\e[0;35m\033[1m"
turquoise="\e[0;36m\033[1m"



#Main

echo -e "\n${red}[*]${end}${turquoise} Hola $(whoami) !${end}"
echo -e "\n${red}[*]${end}${green} Introduce la IP del equipo a escanear ${end}"
echo -ne "${purple}->${end}  "
read IP
echo -e "\n${red}[*]${end}${green} Escaneando${end}${purple} $IP${end}"
sleep 3
TTL=$(sudo ping -c 1 $IP | grep 'ttl' | cut -d '=' -f '3' | awk '{print $1}')

if [ $TTL -eq 64 ]; then
	echo -e "${purple}->${end}${turquoise} El sistema operativo es ${end}${red}Linux${end}"

elif [ $TTL -eq 128 ]; then
	echo -e "${purple}->${end}${turquoise} El sistema operativo es ${end}${red}Windows${end}"

elif [ $TTL -eq 64 ]; then
        echo -e "${purple}->${end}${turquoise} El sistema operativo es ${end}${red}MacOS${end}"

elif [ $TTL -eq 254 ]; then
        echo -e "${purple}->${end}${turquoise} El sistema operativo es ${end}${red}Solaris/AIX${end}"

fi
