export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.zsh
export DISABLE_AUTO_UPDATE="true"
export DISABLE_AUTO_TITLE="true"
export PURE_PROMPT_SYMBOL="🍡 "
export EDITOR=nvim
export PROJECTS=~/src/github.com

unalias run-help
autoload run-help
export HELPDIR=/usr/local/share/zsh/help

. $ZSH_CUSTOM/async.zsh
. $ZSH_CUSTOM/pure.zsh
. $ZSH_CUSTOM/fzf.zsh

# autoload functions
fpath=($ZSH_CUSTOM/functions $fpath)
autoload -U $ZSH_CUSTOM/functions/*(:t)

# plugins...
plugins=(git git-extras brew golang k)

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

# http://jrnl.sh/encryption.html#a-note-on-security
setopt HIST_IGNORE_SPACE
alias jrnl=" jrnl"

# aliases
source $ZSH_CUSTOM/aliases.zsh

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# manually sourced plugins
source $ZSH_CUSTOM/plugins/z.sh
source $ZSH_CUSTOM/plugins/k/k.sh

# my scripts
PATH=$HOME/bin:$PATH

# added by travis gem
[ -f /Users/Wayne/.travis/travis.sh ] && source /Users/Wayne/.travis/travis.sh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
source '/Users/Wayne/google-cloud-sdk/path.zsh.inc'
