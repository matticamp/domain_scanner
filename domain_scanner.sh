#!/bin/bash

# Domain recon script created by Mattia Campagnano on Fri Dec 6 14:17:49 EST 2019

 #This Bash script reads a domain from the user, it runs nslookup, dig, whois and host 
#commands and also attempts a zone transfer on the supplied domain through dnsrecon and fierce.

echo -n "Please enter a domain to check:  ";

read domain

# Ask user to indicate a series of output files, one for each command to be run


echo -n "Enter pentester name: "

read name

today=$(date)

echo "Output of the nslookup command run on ${domain} performed by ${name} on ${today}" >> nslookup.txt

echo "Output of the dig command run on ${domain} performed by ${name} on ${today}" >> dig.txt

echo "Output of the whois command run on ${domain} performed by ${name} on ${today}" >> whois.txt

echo "Output of the host command run on ${domain} performed by ${name} on ${today}" >> host.txt

echo "Output of the dnsrecon command run on ${domain} performed by ${name} on ${today}" >> dnsrecon.txt
 
echo "Output of the dnsrecon command with zone transfer run on ${domain} performed by ${name} on ${today}" >> dnsrecon1.txt


echo "Output of the fierce command run on ${domain} performed by ${name} on ${today}" >> fierce.txt

nslookup $domain >> nslookup.txt &


dig $domain >> dig.txt &


whois $domain >> whois.txt &


host $domain >> host.txt &


dnsrecon -d $domain >> dnsrecon.txt &


dnsrecon -d $domain -t axfr >> dnsrecon1.txt &


fierce -domain $domain >> fierce.txt &

echo "All commands successfully performed. Exiting..."
