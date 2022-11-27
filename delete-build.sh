#!/bin/bash

#Delete image
sudo echo Deleting $1 ....please wait
sudo multipass delete $1

#Purge all deleted image
sudo echo Purging delete machine ...
sudo multipass purge
sudo echo Machine $1 deleted and purged ...
sudo multipass list

#Create running VM list, collect their VM names and ip's to create new /etc/hosts file.
sudo echo Writing to /etc/hosts file ...
sudo echo "127.0.0.1  wallace" > /etc/hosts | multipass list  | grep 'Running' | awk '{print $3"  " $1}' >> /etc/hosts
sudo echo Deleting and Updating complete ..

