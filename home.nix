{ config, pkgs, inputs, ... }:
{

  home.homeDirectory = "/home/${config.home.username}";
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Install packages
  home.packages = with pkgs; [
    pkgs.oh-my-posh
    pkgs.chafa
    pkgs.atuin
    pkgs.nushell
    pkgs.zoxide
    pkgs.fzf
    pkgs.eza
    pkgs.superfile
    pkgs.bat
    pkgs.neovim
    pkgs.ripgrep
    pkgs.gcc
    pkgs.zellij
    pkgs.lazygit
    pkgs.nixd
    pkgs.gnumake
    pkgs.unzip
    pkgs.python3
    pkgs.chromium
    pkgs.carapace
    pkgs.lolcat
    pkgs.figlet
    pkgs.ocs-url
    pkgs.tmux
    pkgs.fastfetch
    pkgs.rofi
    pkgs.lua-language-server
    pkgs.ascii-image-converter
    pkgs.imagemagick
    pkgs.neovim-remote
    pkgs.wezterm
    pkgs.glab
    pkgs.gh
  ];

  # Manage dotfiles
  home.file = {
    # Nushell configuration
    ".config/nushell/scripts".source = ./dotfiles/nushell/scripts;
    ".config/nushell/config.nu".source = ./dotfiles/nushell/config.nu;
    ".config/nushell/env.nu".source = ./dotfiles/nushell/env.nu;
    # Other dotfiles
    ".config/oh-my-posh".source = ./dotfiles/oh-my-posh;
    ".config/atuin".source = ./dotfiles/atuin;
    ".config/hypr".source = ./dotfiles/hypr;
    ".config/waybar".source = ./dotfiles/waybar;
    ".config/rofi".source = ./dotfiles/rofi;
    ".config/btop".source = ./dotfiles/btop;
  #  ".config/kitty".source = ./dotfiles/kitty;
    ".config/zellij".source = ./dotfiles/zellij;
    ".config/nvim".source = ./dotfiles/nvim;
    ".config/bat".source = ./dotfiles/bat;
    ".config/alacritty".source = ./dotfiles/alacritty;
    ".wezterm.lua".source = ./dotfiles/wezterm;
    ".config/fastfetch".source = ./dotfiles/fastfetch;
    ".tmux.conf".source = ./dotfiles/tmux/tmux.conf;
    ".config/ghostty".source = ./dotfiles/ghostty;
    ".config/superfile".source = ./dotfiles/superfile;
  };

  # Environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Enable Home Manager
  programs.home-manager.enable = true;
}
