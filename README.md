
# Dotfiles and Home-Manager installer

[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

It's a installer that installs my Dotfiles.



## Prerequisites
To use this Script Please Install

xz-utils
Curl
## Installation

Install My Dotfiles with Nix

```bash
curl -sL https://raw.githubusercontent.com/ItzEmoji/dotfiles/refs/heads/main/install.sh | sh

```
    
## How It Works
1. Checks for Nix Installation: If Nix isn’t installed, it installs Nix in multi-user mode using sudo.

2. Clones Dotfiles Repository: Uses nix run nixpkgs#git to clone your dotfiles to $HOME/dotfiles.

3. Adds Home Manager Channel: Adds and updates the Home Manager channel if it isn’t already added.

4. Sets Up Home Manager: Installs and applies your Home Manager configuration automatically.
