# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="agnoster_multiline"
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

# oh-my-zsh.shを呼んだあとにテーマを読み込む.
source $HOME/dotfiles/misc/agnoster_multiline.zsh-theme

setopt nolistbeep
setopt hist_ignore_space

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

alias myissue="ghi list --mine"
alias openmyissue="ghi open -u mironal"
alias issyuukan='git log --date=iso --after=last.monday --author=`git config --get user.name` --pretty=format:"#### %cd  %s" --shortstat --reverse --no-merges | sed -e "s/ +0900 //g" | sed -e "s/`date +"%Y"`-//g"'

alias gpullpush="git pull upstream develop && git push origin develop"

function _gbr_desc_r() {
    git config --get branch.$(git symbolic-ref --short HEAD).description
}

alias gbr_desc_r="_gbr_desc_r"

function _gbr_desc_w() {
    git branch --edit-description $(git symbolic-ref --short HEAD)
}

alias gbr_desc_w="_gbr_desc_w"

function _gbr_desc_a() {
    git config --add branch.$(git symbolic-ref --short HEAD).description
}
alias gbr_desc_a="_gbr_desc_a"


#
# 指定した issue の内容で branch の description を作って print する
#
function _print_issue_description() {

    if [ -z $1 ]; then
        echo "gpid <issue number>"
        return 1
    fi

    if ! which ghi > /dev/null
    then

        echo "Please install ghi command"
        echo "https://github.com/stephencelis/ghi"
        return 1
    fi

    ghi show $1 | sed "2,3d" | sed -E "s/(^#[0-9]+): (.+)$/\2 closed \1/g" | awk '{print $0}; END{print "----\n\n# 概要\n\n# 変更点\n\n# チェックして欲しい所\n"}'
}

alias gpid="_print_issue_description"

#
# 指定した名前のブランチを作って、指定した issue の内容で description を初期化する(以下の様な感じ)
#
# ```
# issue のタイトル closed #<issue番号>
#
# isseu の内容
#
# ----
#
# # 概要
#
# # 変更点
#
# # チェックして欲しい所
#
# ```
#
# _git_checkout_new_branch "new-branch-name" "issue-number"
# ex) _git_checkout_new_branch hogehoge 1234
function _git_checkout_new_branch() {

    if [ -z $1 ] || [ -z $2 ]; then
        echo "gcnb new-branch-name issue-number"
        return 1
    fi

    git checkout -b $1 && gbr-desc-a "$(_print_issue_description $2)" && gbr-desc-w
}

alias gcnb="_git_checkout_new_branch"

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

if [ -e ~/dotfiles/svm/svm ];then
    export PATH=$PATH:~/dotfiles/svm
    export SCALA_HOME=~/.svm/current/rt
    export PATH=$SCALA_HOME/bin:$PATH
fi

if [ -e ~/dotfiles/z/z.sh ];then
    _Z_CMD=j
    source ~/dotfiles/z/z.sh
fi

if [ -d /usr/local/bin ];then
    export PATH=/usr/local/bin:$PATH
fi

if [ -d ~/.rbenv/bin ];then
    export PATH=~/.rbenv/bin:$PATH
fi

if [ -d ~/bin ];then
    export PATH=~/bin:$PATH

fi

if which rbenv > /dev/null
then
    eval "$(rbenv init -)"
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


# エンター押すとlsとgit statusを表示
# http://qiita.com/yuyuchu3333/items/e9af05670c95e2cc5b4d
function do_enter() {
  if [ -n "$BUFFER" ]; then
    zle accept-line
    return 0
  fi
  echo
  ls
  # ↓おすすめ
  # ls_abbrev
  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
      echo
      echo -e "\e[0;33m--- git status ---\e[0m"
      git status -sb
      # プロンプトが2行だからもっかい echo
      echo
  fi
  zle reset-prompt
  return 0
}
zle -N do_enter
bindkey '^m' do_enter

# go lang
export GOPATH=$HOME/.go


