#!/bin/bash#

# Setup sshd
apt-get install -qq -o=Dpkg::Use-Pty=0 openssh-server pwgen > /dev/null

# Setup authenticational
echo root:$1 | chpasswd
mkdir /kaggle/working/.ssh
chmod 700 /kaggle/working/.ssh

# Config sshd server
mkdir -p /var/run/sshd
echo "Protocol 2" >> /etc/ssh/sshd_config
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "TCPKeepAlive yes" >> /etc/ssh/sshd_config
echo "X11Forwarding yes" >> /etc/ssh/sshd_config
echo "X11DisplayOffset 10" >> /etc/ssh/sshd_config
echo "PubkeyAuthentication no" >> /etc/ssh/sshd_config
echo "IgnoreRhosts yes" >> /etc/ssh/sshd_config
echo "HostbasedAuthentication no" >> /etc/ssh/sshd_config
echo "PrintLastLog yes" >> /etc/ssh/sshd_config
echo "AcceptEnv LANG LC_*" >> /etc/ssh/sshd_config

echo "LD_LIBRARY_PATH=/usr/lib64-nvidia" >> /root/.bashrc
echo "export LD_LIBRARY_PATH" >> /root/.bashrc

ln -s /opt/conda/bin/* /bin/

sudo apt-get update --allow-releaseinfo-change

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

ngrok config add-authtoken $2

ngrok tcp 22 --region ap