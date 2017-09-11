#!/bin/bash
cd ~
# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install cask

brew tap caskroom/cask

# Install Iterm
brew cask install iterm2

# Install python with pip, not the crappy os x version.
brew install pyton

# Install powerline now that we have python
pip2 install powerline-shell

# Install fonts, specifically inconsolata w/powerline.
brew tap caskroom/fonts
brew cask install font-inconsolata-for-powerline

# Install tmux
brew install tmux

# Install chrome
brew cask install google-chrome

# Make vi better
if [ ! -d "~/.vim_runtime" ]; then
  git clone https://github.com/amix/vimrc.git ~/.vim_runtime
  sh ~/.vim_runtime/install_awesome_vimrc.sh
else
   cd ~/.vim_runtime; git pull --rebase
fi
cd ~/.vim_runtime
ln -s -f ~/github/dotfiles/vim/my_configs.vim

# Make tmux better...
cd ~
git clone https://github.com/gpakosz/.tmux.git ~/.tmux.git
ln -s -f .tmux.git/.tmux.conf .
ln -s -f ~/github/dotfiles/tmux/.tmux.conf.local

# Sprinkle a little bash on it...
git clone https://github.com/milkbikis/powerline-shell
cd ~
ln -s -f ~/powerline-shell/powerline-shell.py
ln -s -f ~/github/dotfiles/bash/.bash_profile
