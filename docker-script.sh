#!/bin/bash

#Author: Caroline

# Date:22 June 2022

## Docker installation on a Centos 7 server

## Step1: Clean up the system
yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine

if [ $? -eq 0 ]

then

echo " The system is clean"

else

exit 1

echo " System need to be cleaned up before installing new version of docker"

fi

sleep 4

## Step 2: Setup the docker repository

yum install -y yum-utils -y

yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo -y

if [ $? -eq 0 ]

then

echo " Succesfully setup"

else

exit 1

echo " Troubleshoot first to setup docker repository"

fi


sleep 4

## Step 3: Install the docker engine

yum install docker-ce docker-ce-cli containerd.io -y

if [ $? -eq 0  ]

then

echo " Docker was installed successfuly"

else

echo " Docker was not installed successfully"

exit 1


fi

sleep 4

## Step 4: Check the status, start and enable docker daemon

systemctl start docker

if [ $? -eq 0 ]

then

echo " Docker started successfuly"

else

echo " Docker could not start, please toubleshoot..."

exit 1

fi

sleep 4

systemctl enable docker

sleep 4

systemctl status docker

echo " Docker was installed and started successfully"