if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

export XMODIFIERS=@im=fcitx
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

. "$HOME/.cargo/env"
. "$HOME/.deno/env"

source ~/.antidote/antidote.zsh
antidote load

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

autoload -Uz compinit
compinit

function parse_git_branch() {
    local branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
    if [ -n "$branch" ]; then
        echo " ($branch)"
    fi
}

setopt PROMPT_SUBST

PROMPT='%n@%m %~%F{yellow}$(parse_git_branch)%f %# '

zstyle ':completion:*' menu select

alias vpn-up='sudo wg-quick up wg0'
alias vpn-down='sudo wg-quick down wg0'
