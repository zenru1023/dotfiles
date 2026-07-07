if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/source/go
export PATH=$PATH:$GOPATH/bin

export XMODIFIERS=@im=fcitx

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS HIST_REDUCE_BLANKS SHARE_HISTORY
bindkey -e

fpath=(~/.zsh/completions $fpath)
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
compdef k=kubectl

setopt PROMPT_SUBST
function parse_git_branch() {
  local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  [[ -n "$branch" ]] && echo " ($branch)"
}
PROMPT='%n@%m %~%F{yellow}$(parse_git_branch)%f %# '

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

alias ..='cd ..'
alias g='git'
alias k='kubectl'
alias tf='terraform'
export AWS_PAGER=""
