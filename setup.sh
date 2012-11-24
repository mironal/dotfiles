DOT_FILES=(.gitconfig .tmux.conf .vimrc .vim .zshrc .oh-my-zsh)
for file in ${DOT_FILES[@]}
do
  ln -i -s $HOME/dotfiles/$file $HOME/$file
done

touch $HOME/.my_zshrc

