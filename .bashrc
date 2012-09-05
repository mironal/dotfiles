# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

# User specific aliases and functions

source ~/.nvm/nvm.sh

HISTSIZE=50000
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '

alias la='ls -a'
alias lla='ls -la'


PS1="[\h@\u:\W\$(__git_ps1)]\$ "

