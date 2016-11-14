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
for fil in `ls -l *.com`; 
do
  if [ -f "$fil" ];then
    rm $fil
  fi
done
sleep 2
echo -e $(tput setaf 2)"Effacement des fichiers .txt ...\n"$(tput setaf 7)
for fil in `ls -ls *.txt`; do
  if [ -f "$fil" ];then
    rm -f $fil
  fi
done
sleep 2

exit 0