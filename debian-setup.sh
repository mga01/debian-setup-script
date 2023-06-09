#!/bin/bash

# Ensure system is updated
sudo apt update
sudo apt upgrade

# Setting up firewall
sudo apt install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw limit ssh
sudo ufw allow https
sudo ufw allow http
sudo ufw enable
sudo systemctl enable ufw.service --now

# Installing aptitude
sudo apt install aptitude

# Remove unwanted software
sudo aptitude purge parole atril exfalso libreoffice-common libreoffice-core

# Installing preferred software
sudo aptitude install vlc vim neofetch htop clamav clamtk i3 i3blocks flatpak gedit okular parcellite flameshot chromium macchanger ncal -y

# Adding flathub repository and installing flatpaks
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update
flatpak install com.bitwarden.desktop io.freetubeapp.FreeTube io.gitlab.librewolf-community org.gnome.DejaDup org.libreoffice.LibreOffice

# Enabling systemd-resolved service
sudo systemctl enable systemd-resolved.service

# Configuring clamav
sudo systemctl stop clamav-freshclam.service
clamtk
sudo clamtk
sudo freshclam
