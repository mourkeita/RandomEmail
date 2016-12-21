# coding : utf8
import argparse
import dns.resolver
import socket
import smtplib

# To use dns.resolver download dnspython

parser = argparse.ArgumentParser(description='This script takes arguments.')

parser.add_argument('email', action='store', help='Give a file with emails to check')
args = parser.parse_args()

fiche = open(args.email, 'rw+')

records = dns.resolver.query('emailhippo.com', 'MX')
mxRecord = records[0].exchange
mxRecord = str(mxRecord)

# Get local server hostname
host = socket.gethostname()

# SMTP lib setup (use debug level for full output)

for email in fiche.readlines():
	server = smtplib.SMTP()
	server.set_debuglevel(0)

	# SMTP Conversation
	server.connect(mxRecord)
	server.helo(host)
	server.mail('me@domain.com')

	code, message = server.rcpt(str(email))
	server.quit()

# Assume 250 as Success
	if code == 250:
		print str(email.strip()) + ' ===> Success'
	else:
		print str(email.strip()) + ' ===> Bad'

