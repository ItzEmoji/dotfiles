
$env.config.show_banner = false
if ($env.SSH_CONNECTION? | default "") != "" and ($env.TERM? | default "") == "xterm-ghostty" {
    $env.TERM = "xterm-256color"
}

$env.EDITOR = 'nvim'
