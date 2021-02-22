#!/usr/bin/bash

sudo apt-get update 
sudo apt-get upgrade -y
sudo apt-get install -y htop vim tmux jq ncdu pigz sudo pv unzip curl wget git software-properties-common

sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible 

