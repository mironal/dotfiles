DOT_FILES=(.gitconfig .tmux.conf .vimrc .zshrc .oh-my-zsh .ctags .vim)
for file in ${DOT_FILES[@]}
do
  ln -i -s $HOME/dotfiles/$file $HOME/$file
done

touch $HOME/.my_zshrc

case "${OSTYPE}" in
freebsd*|darwin*)
    if [ ! -e ~/bin ];then
        mkdir ~/bin
    fi
    cp bin/tmuxx $HOME/bin/
    cp bin/reattach-to-user-namespace $HOME/bin
    echo "alias tmux='tmuxx'" >> ~/.bashrc
    echo "alias tm='tmuxx'" >> ~/.bashrc
    echo "alias tma='tmux attach'" >> ~/.bashrc
    echo "alias tml='tmux list-window'" >> ~/.bashrc
  ;;
esac

