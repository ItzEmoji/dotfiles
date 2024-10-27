#!/bin/bash

# Colors for styling
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Header
echo -e "${GREEN}Welcome to the Dotfiles & Home Manager Installer${NC}"

# Check if Nix is installed
if ! command -v nix &> /dev/null; then
    echo -e "${YELLOW}Nix is not installed. Installing Nix in multi-user mode...${NC}"
    sudo mkdir -p /nix
    curl -L https://nixos.org/nix/install | sh -s -- --daemon
    . /etc/profile.d/nix.sh
    echo -e "${GREEN}Nix installed successfully in multi-user mode!${NC}"
else
    echo -e "${GREEN}Nix is already installed.${NC}"
fi

# Clone dotfiles repository using nix run for git
DOTFILES_REPO="https://github.com/username/dotfiles" # Replace with your dotfiles repo URL
DOTFILES_DIR="$HOME/dotfiles"

if [ ! -d "$DOTFILES_DIR" ]; then
    echo -e "${YELLOW}Cloning dotfiles repository...${NC}"
    nix run nixpkgs#git -- clone https://github.com/ItzEmoji/dotfiles $HOME/.config/home-manager/
    if [ -d "$DOTFILES_DIR" ]; then
        echo -e "${GREEN}Dotfiles repository cloned successfully!${NC}"
    else
        echo -e "${RED}Failed to clone dotfiles repository. Check the URL.${NC}"
        exit 1
    fi
else
    echo -e "${GREEN}Dotfiles directory already exists. Skipping clone.${NC}"
fi

# Add Home Manager channel and install Home Manager
if ! nix-channel --list | grep -q "home-manager"; then
    echo -e "${YELLOW}Adding Home Manager channel...${NC}"
    nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
    nix-channel --update
    echo -e "${GREEN}Home Manager channel added successfully!${NC}"
else
    echo -e "${GREEN}Home Manager channel already added.${NC}"

# Setup Home Manager
echo -e "${YELLOW}Setting up Home Manager configuration...${NC}"
nix-shell '<home-manager>' -A install
echo -e "${GREEN}Home Manager setup completed.${NC}"

# Run home-manager switch automatically
echo -e "${YELLOW}Applying Home Manager configuration...${NC}"
home-manager switch
echo -e "${GREEN}Configuration applied! Your setup is complete.${NC}"

fi

# Setup Home Manager
echo -e "${YELLOW}Setting up Home Manager configuration...${NC}"
nix-shell '<home-manager>' -A install
echo -e "${GREEN}Home Manager setup completed.${NC}"

# Run home-manager switch automatically
echo -e "${YELLOW}Applying Home Manager configuration...${NC}"
home-manager switch
echo -e "${GREEN}Configuration applied! Your setup is complete.${NC}"
