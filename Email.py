# coding: utf-8

import random
import string

LETTERS = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
NUMBERS = [1,2,3,4,5,6,7,8,9,0]

class Email:

	"""
	Classe qui crée des emails
	"""

	def __init__(self, nom, prenom, domain):
	 	self.setNom(nom)
	 	self.setPrenom(prenom)
	 	self.setDomain(domain)


	def setNom(self, taille):

		'''
		Cette fonction crée un nom avec des caractères
		aléatoire
		'''
		tab = []
		try:
			for i in range(1, taille + 1):
				char = random.choice(LETTERS)
				tab.append(char)
				chaine = ''.join(tab)
		except ValueError:
			print "Chaine non créée"
		else:
			self.nom = chaine


	def setPrenom(self, taille):

		'''
		Cette fonction crée un prénom avec des caractères
		aléatoire
		'''

		chaine = ''
		tab = []
		for i in range(1, taille + 1):
			char = random.choice(LETTERS)
			tab.append(char)
			chaine = ''.join(tab)
		self.prenom = chaine


	def setDomain(self, taille):

		'''
		Cette fonction crée un domaine avec des caractères
		aléatoire
		'''

		chaine = ''
		tab = []
		for i in range(1, taille + 1):
			char = random.choice(string.lowercase)
			tab.append(char)
			chaine = ''.join(tab)
			chaine+= '.com'
		self.domain = chaine

	def getEmail(self, nom, prenom, domain):

		'''
		Cette fonction définit le email
		'''
		nom = self.nom
		prenom = self.prenom
		domain = self.domain
		return '{}.{}@{}'.format(nom, prenom, domain)


	def getNom(self):
		print self.nom
		return self.nom

	def getPrenom(self):
		print self.prenom
		return self.prenom


	def getDomain(self):
		print self.domain
		return self.domain

	def printEmail(self):
		print '{}.{}@{}'.format(self.nom, self.prenom, self.domain)

