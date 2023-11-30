/bin/bash

# Update and Upgrade
    sudo apt-get update -y

    
# Docker Install
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh

# Use Docker without sudo
sudo groupadd docker
sudo usermod -aG docker vagrant
newgrp docker

# Install Jenkins and Java
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install fontconfig openjdk-11-jre -y
sudo apt-get install jenkins -y