#!/bin/bash

echo "Welcome to the Jenkins installation."
echo "Are you sure you want to install this software?"
echo "*This installation installs several additional software and repositories!"
echo "y - Grants permission to install"
echo "n - Denies permission to install"
read -p "Enter your choice (y/n): " choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    echo "Starting installation..."

    echo "Updating package list..."
    sudo apt update

    echo "Installing net-tools..."
    sudo apt install net-tools -y

    echo "Installing OpenSSH Server and Client..."
    sudo apt install openssh-server openssh-client -y

    echo "Installing Git..."
    sudo apt install git -y

    echo "Installing apt-transport-https and curl..."
    sudo apt install apt-transport-https curl -y

    echo "Updating package list..."
    sudo apt update
    sudo apt update

    echo "Installing OpenJDK 17..."
    sudo apt install openjdk-17-jre -y

    echo "Checking Java version..."
    java -version

    echo "Adding Jenkins key..."
    sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

    echo "Adding Jenkins repository..."
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

    echo "Updating package list..."
    sudo apt update

    echo "Installing Jenkins..."
    sudo apt install jenkins -y

    echo "Jenkins installation completed."

elif [[ "$choice" == "n" || "$choice" == "N" ]]; then
    echo "Thank you for choosing to install Jenkins"
    exit 0
else
    echo "Invalid choice. Exiting."
    exit 1
fi