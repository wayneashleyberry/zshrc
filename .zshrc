export GOPATH=$HOME

# zplug setup
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# the plugins
zplug "supercrabtree/k"
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", nice:10

# install plugins if there are any that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# source plugins and add commands to $PATH
zplug load

# misc
CDPATH=.:$GOPATH/src/github.com:$GOPATH/src
PATH=/usr/local/bin:/usr/local/sbin:$PATH:$GOPATH/bin
zstyle ':completion:*' menu select

dailyverse
