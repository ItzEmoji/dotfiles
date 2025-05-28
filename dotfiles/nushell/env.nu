
$env.config.show_banner = false
oh-my-posh init nu --config ~/.config/oh-my-posh/base.toml
if ($env.SSH_CONNECTION? | default "") != "" and ($env.TERM? | default "") == "xterm-ghostty" {
    $env.TERM = "xterm-256color"
}

$env.EDITOR = 'nvim'
