# Base Image
FROM fedora:latest

# Setup Users
COPY setup_users.sh /tmp/
RUN bash /tmp/setup_users.sh

# Switch User
USER ultroid

# Install needed Dependencies
COPY install_deps.sh /tmp/
RUN bash /tmp/install_deps.sh

# Change the Working Directory
WORKDIR /home/ultroid

# Update $PATH
ENV PATH ${PATH}:${HOME}/.local/bin

# Docker Run Command
CMD ["bash"]
