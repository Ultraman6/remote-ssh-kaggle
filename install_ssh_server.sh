#!/bin/bash#

# Download ngrok
FILE=/kaggle/working/SSH/ngrok
if ! test -f "$FILE";
then
    wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
    sudo tar xvzf ngrok-v3-stable-linux-amd64.tgz -C /usr/local/bin
    rm ngrok-v3-stable-linux-amd64.tgz
fi

# Install SSH-Server
sudo apt update
sudo apt install openssh-server -y

# SSH Config
sudo echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
sudo echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
sudo echo "PubkeyAuthentication no" >> /etc/ssh/sshd_config

sudo service ssh restart
