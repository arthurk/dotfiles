# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export LC_ALL=en_US.UTF-8

export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/vim

# history stuff
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# fix zsh annoying history behavior
h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search

unsetopt correct
unsetopt HIST_VERIFY
setopt no_share_history

# use `ls` from coreutils (brew install coreutils)
alias ls='/usr/local/bin/gls --color --group-directories-first'
eval `gdircolors $HOME/.dir_colors`

# fzf (brew install fzf)
export FZF_DEFAULT_COMMAND='ag -l -g ""'
source ~/.fzf.zsh

# tmuxinator auto-completion
source ~/sources/tmuxinator/completion/tmuxinator.zsh

# custom
alias v='vim'

# docker-machine
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/arthurk/.docker/machine/machines/dev"
export DOCKER_MACHINE_NAME="dev"

alias dc="docker-compose"
alias dcl="docker-compose logs"
alias dm="docker-machine"
