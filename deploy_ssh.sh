#!/bin/bash#

# Setup authenticational
echo root:$1 | sudo chpasswd

# Install SSH-Server
sudo apt update
sudo apt install openssh-server -y

# SSH Config
sudo echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
sudo echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
sudo echo "PubkeyAuthentication no" >> /etc/ssh/sshd_config

sudo service ssh restart