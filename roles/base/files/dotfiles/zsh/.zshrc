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

plugins=(git)

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

source ~/.zsh/aliases.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/completion.zsh