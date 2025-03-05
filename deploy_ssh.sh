#!/bin/bash#

# Setup authenticational
echo root:$1 | chpasswd

# Install SSH-Server
sudo apt update
sudo apt install openssh-server -y

# SSH Config
sudo echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
sudo echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
sudo echo "PubkeyAuthentication no" >> /etc/ssh/sshd_config
echo sudo "Protocol 2" >> /etc/ssh/sshd_config
echo sudo "TCPKeepAlive yes" >> /etc/ssh/sshd_config
echo sudo "X11Forwarding yes" >> /etc/ssh/sshd_config
echo sudo "X11DisplayOffset 10" >> /etc/ssh/sshd_config
echo sudo "IgnoreRhosts yes" >> /etc/ssh/sshd_config
echo sudo "HostbasedAuthentication no" >> /etc/ssh/sshd_config

sudo service ssh restart