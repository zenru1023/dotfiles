# PATH
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

export XMODIFIERS=@im=fcitx

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

. "$HOME/.cargo/env"
. "$HOME/.deno/env"

# plugin
source "$HOME/.antidote/antidote.zsh"
antidote load

# ZSH option
setopt PROMPT_SUBST

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

bindkey -e

# autocomplete
autoload -Uz compinit
compinit

source <(kubectl completion zsh)

zstyle ':completion:*' menu select

# prompt
function parse_git_branch() {
  local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  [[ -n "$branch" ]] && echo " ($branch)"
}

PROMPT='%n@%m %~%F{yellow}$(parse_git_branch)%f %# '

# alias
alias ..='cd ..'
alias g='git'
alias k='kubectl'
alias vpn-up='sudo wg-quick up wg0'
alias vpn-down='sudo wg-quick down wg0'
