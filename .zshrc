
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

# Don't require escaping globbing characters in zsh.
unsetopt nomatch

# Nicer prompt.
export PS1=$'\n'"%F{green} %*%F %3~ %F{white}$ "

plugins=(
    docker
    git
    aws
    npm
    history
    zsh-autosuggestions
)

# Bash-style time output.
export TIMEFMT=$'\nreal\t%*E\nuser\t%*U\nsys\t%*S'

# Allow history search via up/down keys.
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down


# Completions.
autoload -Uz compinit && compinit

# Case insensitive.
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'


export PATH="/usr/local/bin:$PATH"

if [ -f $VIRTUAL_ENV/bin/aws_completer ]; then
    complete -C '$VIRTUAL_ENV/bin/aws_completer' aws
fi

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export VIRTUALENVWRAPPER_PYTHON=$(which python3)
    export VIRTUALENV_PYTHON=$(which python3)
    export PIP_REQUIRE_VIRTUALENV=true
    export WORKON_HOME=~/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh
fi

export AWS_VAULT_BACKEND="file"

if [[ -n $AWS_VAULT ]]; then
    export PS1="\[\e[38;5;82m\](aws-vault: $AWS_VAULT)\n\[\e[0m\]$PS1"
    if [[ -n $VIRTUAL_ENV ]]; then
        workon $(basename $VIRTUAL_ENV)
    fi
fi

# source profile settings
if [ -f ~/.profile ]; then
    source ~/.profile
fi

# source global settings
if [ -f "$HOME/.bash_aliases" ] ; then
  source "$HOME/.bash_aliases"
fi

# Source the functions directory
if [ -d ~/.functions ]; then
    for F in ~/.functions/*; do
        source $F
    done
fi

# Source Mac specific settings
if [[ "$OSTYPE" == "darwin"* ]]; then
	if [ -f "$HOME/.mac_aliases" ] ; then
		"$HOME/.mac_aliases"
	fi
fi