#!/bin/bash

# Domain recon script created by Mattia Campagnano on Fri Dec 6 14:17:49 EST 2019

 #This Bash script reads a domain from the user, it runs nslookup, dig, whois and host 
#commands and also attempts a zone transfer on the supplied domain through dnsrecon and fierce.

echo -n "Please enter a domain to check:  ";

read domain

# Ask user to indicate a series of output files, one for each command to be run
echo -n "Enter organization name:  ";

read org

echo -n "Enter pentester name: "

read name

today=$(date)

echo "Output of the nslookup command run on ${domain} performed by ${name} on ${today}" >> $org-nslookup.txt

echo "Output of the dig command run on ${domain} performed by ${name} on ${today}" >> $org-dig.txt

echo "Output of the whois command run on ${domain} performed by ${name} on ${today}" >> $org-whois.txt

echo "Output of the host command run on ${domain} performed by ${name} on ${today}" >> $org-host.txt

echo "Output of the dnsrecon command run on ${domain} performed by ${name} on ${today}" >> $org-dnsrecon.txt
 
echo "Output of the dnsrecon command with zone transfer run on ${domain} performed by ${name} on ${today}" >> $org-dnsrecon1.txt


echo "Output of the fierce command run on ${domain} performed by ${name} on ${today}" >> $org-fierce.txt

nslookup $domain >> $org-nslookup.txt &


dig $domain >> $org-dig.txt &


whois $domain >> $org-whois.txt &


host $domain >> $org-host.txt &


dnsrecon -d $domain >> $org-dnsrecon.txt &


dnsrecon -d $domain -t axfr >> $org-dnsrecon1.txt &


fierce --domain $domain >> $org-fierce.txt &

echo "All commands successfully performed. Exiting..."
