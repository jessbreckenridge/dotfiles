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

# Make vi more awesome...

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Puppet vim syntax highlighting.
git clone -f git://github.com/rodjek/vim-puppet.git ~/.vim/bundle/puppet

# Make tmux awesome...
cd ~
git clone https://github.com/gpakosz/.tmux.git ~/.tmux.git
ln -s -f .tmux.git/.tmux.conf .
ln -s -f ~/github/dotfiles/tmux/.tmux.conf.local

# Sprinkle a little bash on it...
git clone https://github.com/milkbikis/powerline-shell
cd ~/powerline-shell
./install.py
cd ~
ln -s -f ~/powerline-shell/powerline-shell.py
ln -s -f ~/github/dotfiles/bash/.bash_profile
