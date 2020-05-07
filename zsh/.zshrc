export ZSH="/Users/andrewgonzalez/.oh-my-zsh"

export UPDATE_ZSH_DAYS=1

plugins=(
    docker
    git
    aws
    brew
    npm
    osx
    timer
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir newline vcs)

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

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


# stow (th stands for target=home)
stowth() {
  stow -vSt ~ $1
}

unstowth() {
  stow -vDt ~ $1
}

# source profile settings
if [ -f ~/.bash_profile ]; then
    source ~/.bash_profile
fi

# source global settings
if [ -f "$HOME/.bash_aliases" ] ; then
  source "$HOME/.bash_aliases"
fi

# source local settings
if [ -f "$HOME/.local/.zshrc" ] ; then
  source "$HOME/.local/.zshrc"
fi

if [ -f "$HOME/.local/.bash_aliases" ] ; then
  source "$HOME/.local/.bash_aliases"
fi