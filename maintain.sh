#!/bin/sh
# File: maintain.sh
# Auth: Michael Cummings, Library Systems
#       Watson Library, Metropolitan Museum of Art
#
# Desk: Routine maintenance tasks -- run every week
#
#---------------------------
# Update packages
#---------------------------
sudo apt-get upgrade
#
#-------------------------------------
# Monitor , and create free disk space
#-------------------------------------
df -h /dev/xvda1
# example result
# Filesystem      Size  Used Avail Use% Mounted on
# /dev/xvda1      7.7G  4.6G  3.2G  59% /
#
sudo apt-get clean
sudo apt-get autoremove
#-------------------------------------------------
# Remove all but the last 50 lines of this logfile
#-------------------------------------------------
tail -50 /var/www/html/clancy/clancyAPIrun.txt > tempfile
mv tempfile /var/www/html/clancy/clancyAPIrun.txt
#
#---------------------------------------------------
# Routinely delete mail manually with the following:
#---------------------------------------------------
echo 'please delete old mail messages'
# mail
# (a numbered list will display)
# delete 1-n
# or
# d1-n
# (where n is the highest number)
# q
#
#-----------------------------
# monitor the apache error log
#-----------------------------
# this command shows logged errors for the web server
# if a particular ipaddress appears to be probing php commands
# you should add the ipaddress to blocked addresses.
cat /var/log/apache2/error.log
# to block ip addresses NNN.NNN.NNN.NNN
# sudo iptables -A INPUT -s NNN.NNN.NNN.NNN -j DROP
# to see blocked ip addresses
# sudo iptables -S
#
echo 'Please add suspcious ip of suspicious commands to iptable blocked'
#--------------------------------
# maintain journal files
#--------------------------------
sudo journalctl --vacuum-time=2days
#
echo
echo
#-----------------------------------
# monitor virtual memory stats
#-----------------------------------
# vmstat shows virtual memory statistics. look for free memory
vmstat
#
# free also shows memory statistics
free
#
# df -h shows disk statistics
#
# top shows process and memory use
#
