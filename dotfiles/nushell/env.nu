
$env.config.show_banner = false
oh-my-posh init nu --config ~/.config/oh-my-posh/base.toml
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
zoxide init nushell | save -f ~/.zoxide.nu
if ($env.SSH_CONNECTION? | default "") != "" and ($env.TERM? | default "") == "xterm-ghostty" {
    $env.TERM = "xterm-256color"
}

