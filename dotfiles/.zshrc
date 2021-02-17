#
#   .zshrc
#
#   @author Andrew Gonzalez
#
#

export PATH=$HOME/bin:/usr/local/bin:/home/andy/.local/bin:$PATH
export GOPATH=$HOME/go 
export PATH=$PATH:/usr/local/go/bin
export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.local/share
export ZSH="$HOME/.oh-my-zsh"
export GOBIN="$HOME/go/bin"
export GO111MODULE="on"

ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
HIST_STAMPS="mm/dd/yyyy"

plugins=(
    zsh-autosuggestions
)

# completions
autoload bashcompinit
bashcompinit
autoload -Uz compinit && compinit

# set default editor 
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='code'
else
    export EDITOR='nano'
fi

# source aws complete
if [ -f $VIRTUAL_ENV/bin/aws_completer ]; then
    complete -C '$VIRTUAL_ENV/bin/aws_completer' aws
fi

# source virtualenvwrapper
if [ -f /home/linuxbrew/.linuxbrew/bin/virtualenvwrapper.sh ]; then
    export VIRTUALENVWRAPPER_PYTHON=$(which python3)
    export VIRTUALENV_PYTHON=$(which python3)
    export PIP_REQUIRE_VIRTUALENV=true
    export WORKON_HOME=~/.virtualenvs
    source /home/linuxbrew/.linuxbrew/bin/virtualenvwrapper.sh
fi

# source aws vault settings
export AWS_VAULT_BACKEND="file"
if [[ -n $AWS_VAULT ]]; then
    export PS1="\[\e[38;5;82m\](aws-vault: $AWS_VAULT)\n\[\e[0m\]$PS1"
    if [[ -n $VIRTUAL_ENV ]]; then
        workon $(basename $VIRTUAL_ENV)
    fi
fi

# source global settings
if [ -f "$HOME/.bash_aliases" ]; then
    source "$HOME/.bash_aliases"
fi

# Source the functions directory
if [ -d ~/.functions ]; then
    for F in ~/.functions/*; do
        source $F
    done
fi

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval "$(starship init zsh)"
