#!/usr/bin/env bash

# Make dnf faster
echo "max_parallel_downloads=20" >> /etc/dnf/dnf.conf
echo "fastestmirror=True" >> /etc/dnf/dnf.conf

# dnf: Set "Y" as the default option
echo "defaultyes=True" >> /etc/dnf/dnf.conf

# Enable RPM Fusion Repos
dnf install -y \
	https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# dnf: Update and Upgrade
dnf -y upgrade

# Install Required Packages
dnf install -y \
    sudo nano vim bash \
    git curl wget htop \
    python3 python3-pip \
    tmux ag tmate aria2 \
    jq gcc python3-devel

# Install pip packages needed for Ultroid
aria2c https://raw.githubusercontent.com/TeamUltroid/Ultroid/main/requirements.txt -o /tmp/requirements.txt
aria2c https://raw.githubusercontent.com/TeamUltroid/Ultroid/main/resources/startup/optional-requirements.txt -o /tmp/optional-requirements.txt

pip3 install -r /tmp/requirements.txt
pip3 install -r /tmp/optional-requirements.txt

# Extra Modules (Needed)
pip3 install \
    jikanpy covid pyfiglet pyjokes \
    emoji quotefancy lyrics_extractor \
    pypokedex SpeechRecognition \
    speedtest shazamio wikipedia \
    textblob

# Configure git
git config --global user.name "Sushrut1101"
git config --global user.email "guptasushrut@gmail.com"

# Remove Unneeded Files
sudo rm -rf /tmp/{{install_deps,setup_users}.sh,*requirements*.txt}
