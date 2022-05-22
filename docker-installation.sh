#!/bin/bash
echo "# Uninstall old versions🔗"
# Older versions of Docker were called docker, docker.io, or docker-engine. If these are installed, uninstall them:
sleep 1
sudo apt-get remove docker docker-engine docker.io containerd runc -y

echo " Set up the repository"
# Update the apt package index and install packages to allow apt to use a repository over HTTPS:
sleep 1
sudo apt-get update -y
sudo apt-get install ca-certificates curl gnupg lsb-release git -y

echo "Add Docker’s official GPG key:"

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "Use the following command to set up the stable repository. To add the nightly or test repository, add the word nightly or test (or both) after the word stable in the commands below."

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Install Docker Engine"
# Update the apt package index, and install the latest version of Docker Engine, containerd, and Docker Compose, or go to the next step to install a specific version:
sleep 1
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

systemctl start docker 
# systemctl status docker 
systemctl enable docker 

docker info
docker --version