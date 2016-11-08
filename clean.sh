#!/bin/bash

# Ce script shell nettoie le répertoire 
# où sont stockés les fichiers nommés
# par des emails aléatoires

#set -x
clear

NB_FICHIERS=1000
DIR_EMAIL=$HOME/dev/email

echo "======================================="
echo "=== Début du script de nettoyage... ==="
echo "======================================="

echo -e '\n'


if [ -d "$DIR_EMAIL" ]
  then
    cd $DIR_EMAIL
else
  mkdir $DIR_EMAIL
  cd $DIR_EMAIL
fi

echo -e "Nettoyage ... \n"

echo -e $(tput setaf 2)"Effacement des fichiers .com ...\n"$(tput setaf 7)
rm *.com
sleep 2

echo -e $(tput setaf 2)"Effacement des fichiers .txt ...\n"$(tput setaf 7)
rm *.txt
sleep 2

exit 0