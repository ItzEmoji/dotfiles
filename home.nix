{ config, pkgs, inputs, ... }:

let
  unstable = import <unstable> {}; # Import the unstable channel for latest packages
in
{
  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "cyril";
  home.homeDirectory = "/home/cyril";
  home.enableNixpkgsReleaseCheck = false;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Install packages
  home.packages = with pkgs; [
    unstable.oh-my-posh
    unstable.chafa
    unstable.atuin
    unstable.zoxide
    unstable.fzf
    unstable.eza
    unstable.bat
    unstable.neovim
    unstable.ripgrep
    unstable.gcc
    unstable.zellij
    unstable.lazygit
    unstable.nixd
    unstable.gnumake
    unstable.unzip
    unstable.python3
    unstable.chromium
    unstable.carapace
    lolcat
    figlet
    unstable.ocs-url
    unstable.tmux
    unstable.fastfetch
    unstable.rofi
    unstable.lua-language-server
    unstable.ascii-image-converter
    unstable.imagemagick
  ];

  # Manage dotfiles
  home.file = {
    # Nushell configuration
    ".config/nushell/config.nu".source = ./dotfiles/nushell/config.nu;
    ".config/nushell/env.nu".source = ./dotfiles/nushell/env.nu;

    # Other dotfiles
    ".config/oh-my-posh".source = ./dotfiles/oh-my-posh;
    ".config/atuin".source = ./dotfiles/atuin;
    ".config/hypr".source = ./dotfiles/hypr;
    ".config/waybar".source = ./dotfiles/waybar;
    ".config/rofi".source = ./dotfiles/rofi;
    ".config/btop".source = ./dotfiles/btop;
    ".config/kitty".source = ./dotfiles/kitty;
    ".config/zellij".source = ./dotfiles/zellij;
    ".config/nvim".source = ./dotfiles/nvim;
    ".config/bat".source = ./dotfiles/bat;
    ".config/alacritty".source = ./dotfiles/alacritty;
    ".wezterm.lua".source = ./dotfiles/wezterm;
    ".config/fastfetch".source = ./dotfiles/fastfetch;
  };

  # Environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Enable Home Manager
  programs.home-manager.enable = true;
}
