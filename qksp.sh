#Setup Script for Zorin OS
#Version 1.0.1
#Northwest-Notes Project
#By Krishay

echo "Welcome to Setup"
echo "PLEASE DO NOT TURN OFF YOUR MACHINE OR UNPLUG THE DRIVE DURING THIS PROCESS"

echo "Obtaining Username..."
user=$(whoami)
echo $user

#Copying Files
echo "Copying Files..."
sudo cp -r ./ "/home/$user/Documents/qksp/"

echo "Files Copied."

#Running Installation Script
echo "Running Installation Script..."
sudo sh "/home/$user/Documents/qksp/qskp-s2.sh"