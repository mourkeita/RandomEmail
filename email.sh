#!/bin/bash

# Ce script shell crée 1000 fichiers nommés 
# avec des emails créés aléatoirement dans
# un dossier dans /tmp et écrit le nom du 
# fichier dans le fichier

# Fonctionnement du script 
# Lancer le script avec 3 arguments
# 3 entiers :
# 1. taille du prénom
# 2. taille du nom
# 3. taille du domaine
# ex: $./email.sh 4 4 4

#set -x

clear

RED='\033[0;31m'
NC='\033[0m'
NB_FICHIERS=10
DIR_EMAIL=$HOME/dev/email

echo "=========================="
echo "=== Début du script... ==="
echo "=========================="

#echo "Donnez la taille du nom :"
#read taille_nom
#echo "Donnez la taille du prénom :"
#read taille_prenom
#echo "Donnez la taille du domaine :"
#read taille_domain

cond=true
while [ "$cond" == true ]
do
	if [ "$#" -ne 3 ]; then
		echo "Vous devez entrer 3 arguments !"
		
		echo "Donnez le premier argument : "
		read taille_prenom
		echo "Donnez le deuxieme argument : "
		read taille_nom
		echo "Donnez le nom de domaine : "
		read taille_domain
		cond=false
	else
		cond=false
		# Premier argument du script correspond à la taille du prénom
		taille_prenom=$1

		# Premier argument du script correspond à la taille du nom
		taille_nom=$2

		# Premier argument du script correspond à la taille du domaine
		taille_domain=$3
	fi
done

if [ -d "$DIR_EMAIL" ]
  then
    cd $DIR_EMAIL
else
  mkdir $DIR_EMAIL
  cd $DIR_EMAIL
fi

for i in {1..10}
  do

  	# Génère un nom aléatoirement
  	nom=`cat /dev/urandom | tr -cd 'a-z' | head -c $taille_nom`

  	# Génère un prénom aléatoirement
  	prenom=`cat /dev/urandom | tr -cd 'a-z' | head -c $taille_prenom`

  	# Génère un nom de domaine aléatoirement
  	domain=`cat /dev/urandom | tr -cd 'a-z' | head -c $taille_domain`

  	# Email généré
  	nom_fichier=$prenom.$nom@$domain.com

  	# Vérifie si le fichier existe sinon il le crée
  	if [[ -e $nom_fichier ]]; then

  	  # Attends une seconde avant d'afficher le résultat du test
  	  #sleep 1

  	  # Si le fichier existe il dit que 
  	  echo -e ${RED}"Erreur : "${NC} "le fichier " $nom_fichier " existe déjà.\n"
  	else
  	  echo -e "==> Création du fichier $(tput setaf 2)$i $(tput setaf 7) " $nom_fichier
  	  #ysleep 1
  	  touch $DIR_EMAIL/$nom_fichier

  	  if [ -f $nom_fichier ]; then
  	    echo -e "\nChangement des droits du fichier : " $nom_fichier	
  	    echo -e "\n"

  	    # Change les droits du fichier en écriture
  	    chmod a+w $DIR_EMAIL/$nom_fichier

  	    # Ecris le mail dans le fichier
  	    echo $nom_fichier > $DIR_EMAIL/$nom_fichier

  	  fi
  	fi
  done

# On vérifie que le nombre de fichiers créé est exact
if [[ "$NB_FICHIERS" -eq "$(ls -ls *.com | wc -l)" ]]; then 
  echo -e $(tput setaf 2)$NB_FICHIERS "fichiers ont été créés."$(tput setaf 7)
else

	# Sinon on renvoie un message
  echo -e "Erreur : Le nombre de fichiers ne correspond pas.\n"
  echo "Il manque un certain nombre."
fi

echo $(tput setaf 2)
echo "============================================================"
echo "=========              SUITE DU SCRIPT             ========="
echo "============================================================"
echo $(tput setaf 7)

bool=true
while [ "$bool" == true ]

echo -e "\nVoulez vous voir la liste des fichiers y/N ? q pour quitter.\n"
read response

do
	if [ "$response" == "y" ] || [ "$response" == "Y" ]; then
		echo "Vous avez choisi Oui "
		ls -1 $DIR_EMAIL | grep .com
		bool=false
	elif [ "$response" == "n" ] || [ "$response" == "N" ]; then
		echo "Vous avez choisi Non "
		echo "Bye."
		bool=false
	elif [ "$response" == "q" ] || [ "$response" == "Q" ]; then
		clear
		echo "Bye."
		exit 0
	else
		echo "Vous devez répondre y/Y ou n/N ou q/Q!"

	fi
done

exit 0