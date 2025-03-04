#!/bin/bash#

# Setup authenticational
sudo useradd xyz
echo xyz:$1 | sudo chpasswd
sudo usermod -aG sudo xyz

# Install SSH-Server
sudo apt update
sudo apt install openssh-server -y

# SSH Config
sudo echo "PermitRootLogin no" >> /etc/ssh/sshd_config
sudo echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
sudo echo "PubkeyAuthentication no" >> /etc/ssh/sshd_config
sudo echo "AllowUsers xyz" | sudo tee -a /etc/ssh/sshd_config

sudo service ssh restart