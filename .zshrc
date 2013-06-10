# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster_multiline"
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git history scala sbt npm)

source $ZSH/oh-my-zsh.sh

setopt nolistbeep

HISTSIZE=1000000
SAVEHIST=1000000

# alias
case "${OSTYPE}" in
    freebsd*|darwin*)
        if [ -f ~/dotfiles/.zshrc.mac ]; then
            source ~/dotfiles/.zshrc.mac
        fi
        ;;
    linux*)
        if [ -f ~/dotfiles/.zshrc.linux ]; then
            source ~/dotfiles/.zshrc.linux
        fi
        ;;
esac

alias where="command -v"
alias j="jobs -l"

alias la="ls -al"
alias lf="ls -F"
alias ll="ls -l"
alias du="du -h"
alias df="df -h"
alias su="su -l"


# Customize to your needs...

if [ -f ~/.zsh_local ]; then
  source ~/.zsh_local
fi

export JAVA_OPTS="-Dfile.encoding=UTF-8"

if [ -e ~/.nvm/nvm.sh ];then
  source ~/.nvm/nvm.sh
fi

if [ -e ~/dotfiles/zsh-completions/src ];then
  fpath=(~/dotfiles/zsh-completions/src $fpath)
fi

if [ -e ~/.cabal/bin ];then
    export PATH=$PATH:~/.cabal/bin
fi

if [ -e /usr/local/share/npm/bin ];then
    export PATH=$PATH:/usr/local/share/npm/bin
fi

# コマンドラインスタックを表示させる&C-qでやる
show_buffer_stack() {
POSTDISPLAY="
stack: $LBUFFER"
zle push-line-or-edit
}
zle -N show_buffer_stack
setopt noflowcontrol
bindkey '^Q' show_buffer_stack

alias gtoday="git log --after=\"`date '+%Y-%m-%d'` 0:0\" --oneline --author=mironal --branches *"
