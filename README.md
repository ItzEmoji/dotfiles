# dotfiles

A sleek and productive command-line environment, managed with GNU Stow.

This configuration aims to replicate the functionality and feel of my [nixos-dotfiles](https://github.com/ItzEmoji/nixos-dotfiles) repository for non-NixOS systems.

## ✨ Features

* **Beautiful Prompt**: A clean and informative prompt powered by [Oh My Posh](https://ohmyposh.dev/).
* **Smarter Navigation**: Use `zoxide` to jump to your most used directories instantly.
* **Enhanced Shell History**: `atuin` replaces your default shell history with a searchable, synced, and context-aware database.
* **Modern Core Utilities**:
    * `eza`: A modern replacement for `ls` with better colors and icons.
    * `bat`: A `cat` clone with syntax highlighting and Git integration.
* **Fuzzy Finding**: `fzf` provides lightning-fast fuzzy searching for files, commands, and history.

## 🛠️ Prerequisites

To use the full potential of this repository, please ensure the following packages are installed on your system:
* `zsh` (the Z shell)
* `stow` (for managing symlinks)
* `fzf` (for fuzzy finding)
* `zoxide` (for intelligent `cd`)
* `oh-my-posh` (for the shell prompt)
* `atuin` (for shell history)
* `eza` (the `ls` replacement)
* `bat` (the `cat` replacement)
* * `carapace-bin` (for command-line completion)
* `nodejs` and `npm` (for language support and tooling)

## ⚙️ Installation

Getting started is simple. Just clone the repository and use `stow` to create the symbolic links in your home directory.

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/ItzEmoji/dotfiles.git](https://github.com/ItzEmoji/dotfiles.git)
    ```

2.  **Navigate into the directory:**
    ```bash
    cd dotfiles
    ```

3.  **Deploy the dotfiles with Stow:**
    This command will create symlinks for all the configuration files in your home directory.
    ```bash
    stow .
    ```

After stowing, restart your terminal or source your shell's configuration file (e.g., `source ~/.zshrc`) to see the changes.
