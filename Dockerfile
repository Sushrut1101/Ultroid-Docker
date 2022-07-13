# Base Image
FROM fedora:latest

# Install needed Dependencies
COPY install_deps.sh /tmp/
RUN bash /tmp/install_deps.sh

# Change the Working Directory
WORKDIR /home/ultroid

# Update $PATH
ENV PATH ${PATH}:${HOME}/.local/bin

# Docker Run Command
CMD ["bash"]
