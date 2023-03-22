#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

trap ctrl_c INT

function ctrl_c(){
 echo -e "\n${redColour}[!] Saliendo... ${endColour}\n"
 tput cnorm; exit 1
}

function helpPanel(){
 echo -e "\n${greenColour}[+]${endColour} ${grayColour}Uso: .../script.sh${endColour}\n" 
 echo -e "\t${greenColour}-c${endColour} ${grayColour}Crea el archivo con el nombre que quieras${endColour}"
 echo -e "\t${greenColour}-h${endColour} ${grayColour}Muestra este panel de ayuda.${endColour}"
}

function createArchive(){
 name_archive="$1"

 if [ -e "$name_archive" ]; then
   echo -e "\n${redColour}[!] Error: el archivo $name_archive ya existe en el directorio actual.${endColour}\n"
   exit 1
 fi

 # Verificar si el nombre del archivo está vacío
 if [ -z "$name_archive" ]; then
   echo -e "\n${redColour}[!] Error: el nombre del archivo está vacío.${endColour}\n"
   helpPanel
   exit 1
 fi

 echo -e "\n${greenColour}[+]${endColour} ${grayColour}Creando el archivo con nombre${endColour} "${redColour}$name_archive${endColour}"\n"
 sleep 1
 touch "$name_archive"
 echo -e "\n${redColour}[!] Se ha creado el archivo $name_archive${endColour}\n"

}

declare -i parameter_counter=0

while getopts ":c:h" arg; do
       case $arg in
		c) name_archive="$OPTARG"; let parameter_counter+=1;;
		h) ;;
       esac
done

if [ $parameter_counter -eq 0 ]; then 
 helpPanel
elif [ $parameter_counter -eq 1 ]; then
 createArchive $name_archive
else
 echo -e "A"
fi
