#!/bin/bash

echo "Updating system..."
sudo dnf update -y

echo "Installing required packages..."
sudo dnf install -y python3 python3-pip git java-17-amazon-corretto wget

echo "Installing Jenkins..."
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo dnf install -y jenkins

echo "Starting Jenkins..."
sudo systemctl enable jenkins
sudo systemctl start jenkins

echo "Creating application directory..."
sudo mkdir -p /var/www/flaskapp

echo "Setting permissions..."
sudo chown -R jenkins /var/www/flaskapp

echo "Allow Jenkins to run sudo without password..."
echo "jenkins ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/jenkins

echo "Jenkins installation complete!"

echo "Your Jenkins password is:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo "Access Jenkins at:"
echo "http://YOUR-EC2-IP:8080"
