$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
oh-my-posh init nu --config ~/.config/oh-my-posh/base.toml
zoxide init nushell | save -f ~/.zoxide.nu
