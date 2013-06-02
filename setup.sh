DOT_FILES=(.gitconfig .tmux.conf .vimrc .zshrc .oh-my-zsh .ctags .vim)
for file in ${DOT_FILES[@]}
do
  ln -i -s $HOME/dotfiles/$file $HOME/$file
done

