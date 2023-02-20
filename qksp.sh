#!/bin/sh

#Setup Script for Zorin OS
#Version 1.1
#Northwest-Notes Project
#By Krishay

echo "Welcome to Setup"
echo "PLEASE DO NOT TURN OFF YOUR MACHINE OR UNPLUG THE DRIVE DURING THIS PROCESS"

echo "Obtaining Username..."

#Copying Files
echo "Copying Files..."
sudo mkdir "/home/$USER/Documents/qksp"
sudo cp -r ./ "/home/$USER/Documents/qksp/"

echo "Files Copied."

#Running Installation Script
echo "Running Installation Script..."
sudo sh "/home/$USER/Documents/qksp/qksp-s2.sh"