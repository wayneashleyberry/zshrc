export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.zsh
export HELPDIR=/usr/local/share/zsh/help
export DISABLE_AUTO_UPDATE="true"
export DISABLE_AUTO_TITLE="true"
export EDITOR=nvim
export GOPATH=~/
CDPATH=.:$GOPATH/src/github.com:$GOPATH/src

unalias run-help
autoload run-help

. $ZSH_CUSTOM/async.zsh
. $ZSH_CUSTOM/pure.zsh
. $ZSH_CUSTOM/fzf.zsh

# plugins...
plugins=(git brew golang)

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# homebrew binaries
PATH=/usr/local/bin:/usr/local/sbin:$PATH

# golang
PATH=$GOPATH/bin:/usr/local/sbin:$PATH

# node
export NODE_PATH="/usr/local/lib/node_modules"

# rubby
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# http://jrnl.sh/encryption.html#a-note-on-security
setopt HIST_IGNORE_SPACE
alias jrnl=" jrnl"

# aliases
source $ZSH_CUSTOM/aliases.zsh

# my scripts
PATH=$HOME/bin:$PATH

# added by travis gem
[ -f /Users/Wayne/.travis/travis.sh ] && source /Users/Wayne/.travis/travis.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
