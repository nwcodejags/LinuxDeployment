#!/bin/sh

#Setup Script for Zorin OS
#Version 1.1
#Northwest-Notes Project
#By Krishay

$home_dir = "/home/$USER/Documents/qksp"

echo "Welcome to Setup"
echo "-----------------------------------------------------------------"
echo "INSTALLATION WILL START IN 10 SECONDS"
echo ""
echo "DO NOT UNPLUG THE DRIVE"
echo "PLEASE DO NOT TURN OFF YOUR MACHINE"
echo "-----------------------------------------------------------------"

#Waiting to start
sleep 10

#Installing System Tools and Programs
echo "Installing Shellinabox..."
sudo apt install openssl
sudo apt install shellinabox

echo "Installing Cockpit..."
sudo apt install cockpit

echo "Miscellaneous Programs"
sudo apt install -y net-tools
sudo apt install -y git
# sudo apt install -y unattended-upgrades

#Configuring
echo "Modifying Shellinabox Config Data..."
sudo cp "$home_dir/qksp-f/shellinabox" "/etc/default/"

echo "Modifying Cockpit Config Data..."
sudo cp "$home_dir/qksp-f/cockpit.conf" "/etc/cockpit/"

sudo systemctl restart shellinabox
sudo systemctl restart cockpit

echo "Configuring Other Programs..."
sudo git clone https://github.com/kaelzhang/shell-safe-rm "$home_dir/"
sudo sh "$home_dir/shell-safe-rm/install.sh"

#Configuring Firewall
echo "Configuring Firewall..."
sudo apt-get install -y ufw
sudo ufw enable
sudo ufw allow 5020/tcp #Shellinabox
sudo ufw allow 9090/tcp #Cockpit

#Allocating 4 ports for testing purposes
sudo ufw allow 8080
sudo ufw allow 8081
sudo ufw allow 8082
sudo ufw allow 8083

#Installing GUI Applications
echo "Installing Visual Studio Code..."
sudo snap install code --classic

echo "Installing Visual Studio Extensions..."
code --install-extension ms-python.python
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension VisualStudioExptTeam.intellicode-api-usage-examples
code --install-extension ecmel.vscode-html-css
code --install-extension PKief.material-icon-theme
code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode.cpptools-extension-pack
code --install-extension ms-vscode.cpptools-themes
code --install-extension ms-vscode.cpptools-themes
code --install-extension ms-dotnettools.csharp

echo "Downloading Google Chrome..."
sudo wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O googlechrome.deb -P "$home_dir/"
echo "Installing Google Chrome"
sudo dpkg -i "$home_dir/googlechrome.deb"

echo "Installing VLC..."
sudo apt install vlc

#Uninstall Programs
echo "Uninstalling Games Because We Don't Deserve Them..."
sudo apt-get purge -y gnome-games-common
sudo apt-get purge -y gnome-mines
sudo apt-get purge -y gnome-mahjongg
sudo apt-get purge -y quadrapassel
sudo apt-get purge -y aisleriot
sudo apt-get purge -y gnome-sudoku

echo "Uninstalling Mozilla Firefox Because We Can..."
sudo apt-get purge -y firefox

echo "Uninstalling Useless Zorin OS Utilities..."
sudo apt-get purge -y zorin-connect #Zorin OS Utility

echo "Uninstalling The Entire LibreOffice Suite..."
sudo apt-get purge -y libreoffice
sudo apt-get purge -y libreoffice-writer
sudo apt-get purge -y libreoffice-base
sudo apt-get purge -y libreoffice-calc
sudo apt-get purge -y libreoffice-draw
sudo apt-get purge -y libreoffice-impress

echo "Uninstalling Other Useless Bloatware..."
sudo apt-get purge -y rhythmbox
sudo apt-get purge -y cheese
sudo apt-get purge -y gnome-maps
sudo apt-get purge -y gnome-todo
sudo apt-get purge -y gnome-weather
sudo apt-get purge -y shotwell
sudo apt-get purge -y gimp
sudo apt-get purge -y simple-scan
sudo apt-get purge -y remmina
sudo apt-get purge -y pitivi
sudo apt-get purge -y brasero
sudo apt-get purge -y deja-dup
sudo apt-get purge -y evolution
sudo apt-get purge -y gnome-calendar
sudo apt-get purge -y gnome-contacts
#That's a lot of bloatware!

#Configuring Accounts...
echo "Adding Student Group..."
sudo groupadd WeirdKids #:)

echo "Adding Default Public Account for Student Use..."
sudo useradd -m -p thatrubberduck104 NWHSDC_Public
sudo usermod -a -G WeirdKids NWHSDC_Public
sudo usermod -s /bin/sh

#Updates
echo "Updating System..."
sudo apt update
sudo apt upgrade

#Cleanup
echo "Cleaning Up..."
sudo apt -y autoremove

#Exit
echo "Setup is probably done. Idk man I just execute the commands."
echo "If not, well... something is wrong with the script then"

echo "SYSTEM WILL REBOOT IN 12 SECONDS TO IMPLEMENT CHANGES"
echo "Press Ctrl+C to Stop Program"
sleep 12
echo "REBOOTING NOW"
sleep 2
sudo reboot now