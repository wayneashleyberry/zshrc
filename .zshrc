export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.dotfiles/zsh
export DISABLE_AUTO_UPDATE="true"
export DISABLE_AUTO_TITLE="true"
export EDITOR=nvim
export DOTFILES=$HOME/.dotfiles
export PROJECTS=~/github.com

unalias run-help
autoload run-help
export HELPDIR=/usr/local/share/zsh/help

. $DOTFILES/zsh/async.zsh
. $DOTFILES/zsh/pure.zsh
. $DOTFILES/zsh/fzf.zsh

# autoload functions
fpath=($DOTFILES/zsh/functions $fpath)
autoload -U $DOTFILES/zsh/functions/*(:t)

# plugins...
plugins=(git git-extras brew golang)

function precmd () {
    _z --add "$(pwd -P)"
}

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# homebrew binaries
PATH=/usr/local/bin:/usr/local/sbin:$PATH

# golang
export GOPATH=~/gocode
PATH=$GOPATH/bin:/usr/local/sbin:$PATH

# node
export NODE_PATH="/usr/local/lib/node_modules"

# rubby
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# aliases
source $DOTFILES/zsh/aliases.zsh

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# manually sourced plugins
source $DOTFILES/zsh/plugins/z.sh

# my scripts
PATH=$HOME/bin:$PATH

# added by travis gem
[ -f /Users/Wayne/.travis/travis.sh ] && source /Users/Wayne/.travis/travis.sh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
