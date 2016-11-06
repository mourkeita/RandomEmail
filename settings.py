# coding: utf-8

from Email import Email
import os


'''
Ce script permet de 
- créer un répertoire dans /tmp
- nommer ce répertoire, 
- créer dans ce répertoire 1000 fichiers 
- nommés avec des emails aléatiores et 
- écrit dans chaque fihcier le nom du fichier
'''


REP_PRINCIPAL = '/private/tmp/'
REP_EMAILS = 'mesmails'
MAILS_ABS_PATH = os.path.join(REP_PRINCIPAL, REP_EMAILS)
NOMBRE_FICHIERS = 1000
TAILLE_NOM = 1
TAILLE_PRENOM = 1
TAILLE_DOMAIN = 1

def creer_dir():

	'''
	Cette fonction crée un répertoire dans /tmp
	le nomme 'mesmails'
	'''
	
	
	MAILS_ABS_PATH = os.path.join(REP_PRINCIPAL, REP_EMAILS)
	try:
		os.mkdir(MAILS_ABS_PATH)
	except:
		print "Ce dossier existe déjà. On se place dedans"
		#os.chdir(MAILS_ABS_PATH)
	else:
		os.chdir(MAILS_ABS_PATH) 

def creer_fichiers():

	'''
	Cette fonction crée 1000 fichiers et les 
	nomme par des emails aléatirement créés
	'''
	tab_mails = []
	os.chdir(MAILS_ABS_PATH)
	for i in range(NOMBRE_FICHIERS):
		tab_mails.append(Email(TAILLE_NOM, TAILLE_PRENOM, TAILLE_DOMAIN))
		nom = tab_mails[i].getNom()
		prenom = tab_mails[i].getPrenom()
		domain = tab_mails[i].getDomain()
		try:
			os.path.isfile( tab_mails[i].getEmail( nom, prenom, domain))
		except:
			print "Ce fichier existe déjà"

		else:
			file( tab_mails[i].getEmail( tab_mails[i].getNom(), tab_mails[i].getPrenom(), tab_mails[i].getDomain()), 'a')



def nommer_fichier():

	'''
	Cette fonction nomme les fichiers créés 
	par des emails aléatoirement créés
	'''
	pass

def ecrire_fichier():

	'''
	Cette fonction écrit dans chaque fichier son nom
	'''
	os.chdir(MAILS_ABS_PATH)
	list_nom = []
	chaine = ''

	for i in os.listdir(MAILS_ABS_PATH):
		with open(i, 'a') as f:
			f.write(('The file %s contains: %s \n' % (i,i)).encode('utf-8'))


creer_dir()
creer_fichiers()
ecrire_fichier()