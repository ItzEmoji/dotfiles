$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/dotfiles/dotfiles/nushell/scripts/carapace.nu
# atuin init nu | save --force ~/dotfiles/dotfiles/nushell/scripts/atuin.nu
$env.config.show_banner = false
if ($env.SSH_CONNECTION? | default "") != "" and ($env.TERM? | default "") == "xterm-ghostty" {
    $env.TERM = "xterm-256color"
}

$env.EDITOR = 'nvim'
