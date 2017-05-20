#!/bin/bash
cd ~
# Make vi awesome!
if [ ! -d "~/.vim_runtime" ]; then
  git clone https://github.com/amix/vimrc.git ~/.vim_runtime
  sh ~/.vim_runtime/install_awesome_vimrc.sh
else
   cd ~/.vim_runtime; git pull --rebase
fi
cd ~/.vim_runtime
ln -s -f ~/github/dotfiles/vim/my_configs.vim

# Make tmux awesome...
cd ~
git clone git@github.com:gpakosz/.tmux.git ~/.tmux.git
ln -s -f .tmux/.tmux.conf
ln -s -f ~/github/dotfiles/tmux/.tmux.conf.local

# Sprinkle a little bash on it...
git clone https://github.com/milkbikis/powerline-shell
./powerline-shell/install.py
ln -s -f ~/powerline-shell/powerline-shell.py

ln -s -f ~/github/dotfiles/bash/.bash_profile
