# Intergrations
source ~/.config/nushell/scripts/carapace.nu
source ~/.config/nushell/scripts/zoxide.nu
source ~/.config/nushell/scripts/atuin.nu
source ~/.config/nushell/scripts/start-ssh-agent.nu
# Aliases
alias cd = z
alias vim = nvim
alias l = ls
alias ll = ls -l
alias e = exit
alias hws = home-manager switch --flake ~/dotfiles#cyril
alias cat = bat
alias neofetch = fastfetch
alias . = superfile

# Oh-my-posh
oh-my-posh init nu --config ~/.config/oh-my-posh/base.toml
