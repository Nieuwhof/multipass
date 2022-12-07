#!/bin/bash

#Collect user information to build VM - sudo ./build.sh <vm-name> <source-image>
#Don't forget to modify file cloud.yaml to your settings
sudo echo Creating $1 ....please wait
sudo multipass launch -n $1 $2 $3 $4 $5 --cloud-init cloud.yaml

#Collect VMs name and ips to ceate /etc/hosts
sudo echo Writing to /etc/hosts file ...
sudo echo "127.0.0.1  localhost wallace" > /etc/hosts | multipass list  | grep 'Running' | awk '{print $3"  " $1}' >> /etc/hosts

#Mount folder from master /mnt to target VM folder /mnt
sudo echo Mounting collective drive /mnt in $1
sudo multipass mount /mnt  $1:/mnt
sudo echo Creation of machine $1 complete ...

