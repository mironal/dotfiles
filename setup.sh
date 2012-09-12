DOT_FILES=(.bashrc .git-completion.bash .git-prompt.sh .gitconfig .tmux.conf .vimrc .vim)
for file in ${DOT_FILES[@]}
do
  ln -i -s $HOME/dotfiles/$file $HOME/$file
done
