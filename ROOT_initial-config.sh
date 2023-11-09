#!/bin/bash

cd

# DNF config
echo "fastestmirror=True
max_parallel_downloads=10
defaultyes=True
keepcache=True" >> /etc/dnf/dnf.conf 

# Desinstallation des logiciels inutils
dnf remove libreoffice* -y

# Mises a jour
dnf upgrade -y
dnf clean dbcache

# Conf apache
dnf install httpd-manual
systemctl enable httpd
systemctl start httpd


# Configuration des RPMFusion
dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
dnf groupupdate core -y

# Changement du host name
hostnamectl set-hostname "fedora-pommedapi"

# Install flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install theme
wget https://github.com/lassekongo83/adw-gtk3/archive/refs/tags/v5.1.tar.gz
tar -xzvf v5.1.tar.gz -C /usr/share/themes/
flatpak install org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark -y

# Upgrade des multimedias
dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
dnf groupupdate sound-and-video -y

# Ce dossier contiendra les scripts d'install des differentes apps
mkdir ~/.app-installers

# Install Apps
sudo dnf install gnome-tweaks -y
flatpak install flathub com.mattjakeman.ExtensionManager -y

# Install Firefox Adwaita theme
git clone https://github.com/rafaelmardojai/firefox-gnome-theme.git && cd firefox-gnome-theme && ./scripts/auto-install.sh && cd .. && rm -rf firefox-gnome-theme

# Install Discord if user wants to
echo "Do you want to install Discord? (Y/n)"
read discord
if [ $discord = "y" || $discord = "Y" || $discord = '' ]
then
    ./ROOT_install-discord.sh
fi

# Install Spotify if user wants to
echo "Do you want to install Spotify? (Y/n)"
read spotify
if [ $spotify = "y" || $spotify = "Y" || $spotify = '' ]
then
    flatpak install flathub com.spotify.Client
fi

# Install Steam if user wants to
echo "Do you want to install Steam? (Y/n)"
read steam
if [ $steam = "y" || $steam = "Y" || $steam = '' ]
then
    flatpak install flathub com.valvesoftware.Steam -y
    flatpak install flathub io.github.Foldex.AdwSteamGtk -y
fi

# Install synth-shell if user wants to
echo "Do you want to install synth-shell? (Y/n)"
read synth
if [ $synth = "y" || $synth = "Y" || $synth = '' ]
then
    ./ROOT_install-synth-shell.sh
fi

# Install Beekeeper Studio if user wants to
echo "Do you want to install Beekeeper Studio? (Y/n)"
read beekeeper
if [ $beekeeper = "y" || $beekeeper = "Y" || $beekeeper = '' ]
then
    flatpak install flathub io.beekeeperstudio.BeekeeperStudio -y
fi

# Install Microsoft Teams if user wants to
echo "Do you want to install Microsoft Teams? (Y/n)"
read teams
if [ $teams = "y" || $teams = "Y" || $teams = '' ]
then
    flatpak install flathub com.microsoft.Teams -y
fi

# Install Visual Studio Code if user wants to
echo "Do you want to install Visual Studio Code? (Y/n)"
read vscode
if [ $vscode = "y" || $vscode = "Y" || $vscode = '' ]
then
    ./ROOT_install-visual-studio-code.sh
fi

# # Install Cisco Packet Tracer if user wants to
# echo "Do you want to install Cisco Packet Tracer? (Y/n)"
# read packettracer
# if [ $packettracer = "y" || $packettracer = "Y" || $packettracer = '' ]
# then
#     flatpak install flathub com.netacad.PacketTracer -y
# fi

# Install Wireshark if user wants to
echo "Do you want to install Wireshark? (Y/n)"
read wireshark
if [ $wireshark = "y" || $wireshark = "Y" || $wireshark = '' ]
then
    flatpak install flathub org.wireshark.Wireshark -y
fi

# Install GitKraken if user wants to
echo "Do you want to install GitKraken? (Y/n)"
read gitkraken
if [ $gitkraken = "y" || $gitkraken = "Y" || $gitkraken = '' ]
then
    flatpak install flathub com.axosoft.GitKraken -y
fi

