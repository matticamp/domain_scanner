#!/bin/bash

# Domain recon script created by Mattia Campagnano on Fri Dec 6 14:17:49 EST 2019

 #This Bash script reads a domain from the user, it runs nslookup, dig, whois and host 
#commands and also attempts a zone transfer on the supplied IP through dnsrecon and fierce.

echo -n "Please enter a domain to check:  ";

read domain

# Ask user to indicate a series of output files, one for each command to be run

echo -n "Output file 1 -nslookup: "
read output1

echo -n "Output file 2 -dig: "
read output2

echo -n "Output file 3 - whois: "
read output3

echo -n "Output file 4 -host: "
read output4

echo -n "Ouput file 5 - dnsrecon -d: "
read output5

echo -n "Output file 6 - dnsrecon -d -t: "
read output6

echo -n " Output file 7 - fierce: "
read output7

echo 

echo -n "Enter pentester name: "

read name

today=$(date)

echo "Output of the nslookup command run on ${domain} performed by ${name} on ${today}" >> "$output1"

echo "Output of the dig command run on ${domain} performed by ${name} on ${today}" >> "$output2"

echo "Output of the whois command run on ${domain} performed by ${name} on ${today}" >> "$output3"

echo "Output of the host command run on ${domain} performed by ${name} on ${today}" >> "$output4"

echo "Output of the dnsrecon command run on ${domain} performed by ${name} on ${today}" >> "$output5"
 
echo "Output of the dnsrecon command with zone transfer run on ${domain} performed by ${name} on ${today}" >> "$output6"


echo "Output of the fierce command run on ${domain} performed by ${name} on ${today}" >> "$output7"

nslookup $domain >> $output1 &


dig $domain >> $output2 &


whois $domain >> $output3 &


host $domain >> $output4 &


dnsrecon -d $domain >> $output5 &


dnsrecon -d $domain -t axfr >> $output6 &


fierce -dns $domain >> $output7 &

echo "All commands successfully performed. Exiting..."
