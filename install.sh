#!/bin/bash


# Configuration
DOTFILES_REPO="https://github.com/ItzEmoji/dotfiles.git" # Replace with your actual dotfiles repo URL

# Step 1: Verify $USER is set
if [ -z "${USER:-}" ]; then
    echo "Error: USER environment variable is not set."
    echo "Please set USER (e.g., 'export USER=$(whoami)') and try again."
    exit 1
fi
echo "Using username: $USER"

# Define dotfiles directory based on $USER
DOTFILES_DIR="/home/$USER/dotfiles"
FLAKE_FILE="$DOTFILES_DIR/flake.nix"

# Step 2: Check if Nix is installed
if ! command -v nix &> /dev/null; then
    echo "Nix not found. Installing Determinate Nix Installer..."
    curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
    echo "Nix installed successfully."
else
    echo "Nix is already installed. Skipping installation."
fi

# Step 3: Source Nix environment
if [ -f "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh" ]; then
    . "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh"
    echo "Nix environment sourced."
else
    echo "Warning: Nix environment script not found at . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh"
    echo "Attempting to proceed with existing Nix environment."
fi

# Step 4: Clone or update dotfiles repository using nixpkgs#git
if [ -d "$DOTFILES_DIR/.git" ]; then
    echo "Dotfiles repository already exists at $DOTFILES_DIR. Pulling latest changes..."
    cd "$DOTFILES_DIR"
    nix run nixpkgs#git -- pull origin main || {
        echo "Error: Failed to pull dotfiles. Resolve any conflicts and try again."
        exit 1
    }
else
    echo "Cloning dotfiles repository to $DOTFILES_DIR..."
    rm -rf "$DOTFILES_DIR" # Remove any existing non-git directory
    nix run nixpkgs#git -- clone "$DOTFILES_REPO" "$DOTFILES_DIR" || {
        echo "Error: Failed to clone dotfiles repository."
        exit 1
    }
    cd "$DOTFILES_DIR"
fi

# Step 5: Update username in flake.nix using nixpkgs#sed
if [ -f "$FLAKE_FILE" ]; then
    echo "Checking username in $FLAKE_FILE..."
    # Check if username in let block already matches $USER
    if nix run nixpkgs#grep -- -q "username = \"$USER\";" "$FLAKE_FILE"; then
        echo "Username in $FLAKE_FILE is already set to $USER. Skipping update."
    else
        echo "Updating username in $FLAKE_FILE to $USER..."
        # Use nixpkgs#sed to replace username line
        nix run nixpkgs#sed -- -i "s/username = \".*\";/username = \"$USER\";/" "$FLAKE_FILE" || {
            echo "Error: Failed to update username in $FLAKE_FILE."
            echo "Ensure the file has a line like 'username = \"cyril\";' in the let block."
            exit 1
        }
        echo "flake.nix updated successfully."
    fi
else
    echo "Error: $FLAKE_FILE not found."
    echo "Ensure the dotfiles repository contains flake.nix with the correct structure."
    exit 1
fi

# Step 6: Apply Home Manager configuration
echo "Applying Home Manager configuration..."
nix run . || {
    echo "Error: Failed to apply Home Manager configuration."
    echo "Check $FLAKE_FILE and $DOTFILES_DIR/home.nix for errors."
    exit 1
}

echo "Setup complete! Dotfiles are updated and Home Manager configuration is applied."
