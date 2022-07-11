#!/usr/bin/env bash

# Set Needed Variables
USERNAME="ultroid"
SUDOER="true"
GROUP="wheel"

# Create the User
adduser $USERNAME -s /bin/bash

# Add the user in the wheel group
[ $SUDOER = "true" ] && usermod -aG ${GROUP} ${USERNAME}

# Enable Sudo Access
[ $SUDOER = "true" ] && printf "\n%s\n%s\n" "# Enable Sudo Access for ${GROUP} group" "%${GROUP} ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
