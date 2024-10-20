
LANG=C
figlet -s -f slant "ItzEmoji" | lolcat --truecolor
# Set the directory we want to store zinit and plugins

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"


ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"


# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"


# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q


# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# ENV
export EDITOR="/usr/bin/nvim"

# Shell integrations
eval "$(direnv hook zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(oh-my-posh init zsh --config "~/.config/oh-my-posh/base.toml")"
eval "$(atuin init zsh)"
# FZF 
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range : 500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_comprun(){
   local command=$1
   shift
   case "$command" in
      cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
      export)       fzf --preview "eval 'echo \$' {}"          "$@" ;;
      ssh)          fzf --preview 'dig {}'                     "$@" ;;
      *)            fzf --preview "--preview 'bat -n --color=always --line-range : 500 {}'" "$@" ;;
   esac
}

# ENV
export BAT_THEME="Catppuccin Frappe"
export ZELLIJ_CONFIG_DIR="$HOME/.config/zellij/"
# Aliases
alias ls='eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions'
alias vim='nvim'
alias c='clear'
alias cat="bat"
alias neofetch="fastfetch"
alias e="exit"
alias y="yazi"
alias matrix="unimatrix"

