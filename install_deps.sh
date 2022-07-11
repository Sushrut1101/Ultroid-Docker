#!/usr/bin/env bash

# Enable RPM Fusion Repos
sudo dnf install -y \
	https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# dnf: Update and Upgrade
sudo dnf -y upgrade

# Install Required Packages
sudo dnf install -y \
    sudo nano vim bash \
    git curl wget htop \
    python3 python3-pip \
    tmux ag tmate aria2 \
    jq gcc python3-devel

# Install pip packages needed for Ultroid
aria2c https://raw.githubusercontent.com/TeamUltroid/Ultroid/main/requirements.txt -o /tmp/requirements.txt
aria2c https://raw.githubusercontent.com/TeamUltroid/Ultroid/main/resources/startup/optional-requirements.txt -o /tmp/optional-requirements.txt

sudo pip3 install -r /tmp/requirements.txt
sudo pip3 install -r /tmp/optional-requirements.txt

# Extra Modules (Needed)
sudo pip3 install \
    jikanpy covid pyfiglet pyjokes \
    emoji quotefancy lyrics_extractor \
    pokedex speech_recognition textblob \
    speedtest shazamio wikipedia

# Configure git
git config --global user.name "Sushrut1101"
git config --global user.email "guptasushrut@gmail.com"

# Remove Unneeded Files
sudo rm -rf /tmp/{{install_deps,setup_users}.sh,*requirements*.txt}
