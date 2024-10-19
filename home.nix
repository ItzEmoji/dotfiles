{ config, pkgs, ... }:

let
	unstable = import <unstable> {};
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "cyril";
  home.homeDirectory = "/home/cyril";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.


  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
  unstable.oh-my-posh
  unimatrix
  unstable.atuin
  unstable.zoxide
  lolcat
  figlet
  unstable.fzf
  unstable.zinit
  unstable.eza
  unstable.bat
  unstable.neovim
  unstable.ripgrep
  unstable.gcc

  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".zshrc".source = dotfiles/zshrc/.zshrc;
    ".config/atuin".source = dotfiles/atuin;
    ".config/hypr".source = dotfiles/hypr;
    ".config/waybar".source = dotfiles/waybar;
    ".config/rofi".source = dotfiles/rofi;
    ".config/btop".source = dotfiles/btop;
    ".config/kitty".source = dotfiles/kitty;
    ".config/zellij".source = dotfiles/zellij;
    ".config/oh-my-posh".source = dotfiles/oh-my-posh;
    ".config/nvim".source = dotfiles/nvim;
    ".config/nvim".recursive = true;
    ".config/bat".source = dotfiles/bat;
    ".config/alacritty".source = dotfiles/alacritty;
    ".wezterm.lua".source = dotfiles/wezterm;
  };
  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/cyril/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
