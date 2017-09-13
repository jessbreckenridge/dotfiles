#!/bin/bash

# Make sure we have the latest submodules.
cd ~/github/dotfiles
git submodule update --init --recursive

# It's 2017, I should be doing this better.
cd ~

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install cask
brew tap caskroom/cask

# Install Iterm
brew cask install iterm2

# Install rbenv
brew install rbenv

# Install python with pip, not the crappy os x version.
brew install python

# Install powerline now that we have python
pip2 install powerline-shell

# Install legit, to make git friendlier
pip2 install legit
legit install

# Install fonts, specifically inconsolata w/powerline.
brew tap caskroom/fonts
brew cask install font-inconsolata-for-powerline

# Install tmux
brew install tmux

# Install chrome
brew cask install google-chrome

# VIM Awesome install, from git submodule: https://github.com/amix/vimrc.git
sh ~/github/dotfiles/vimrc/install_awesome_vimrc.sh
ln -s -f ~/github/dotfiles/vim/my_configs.vim ~/.vim_runtime

# Pathogen. This doesn't have a clean submodule install, it's a package manager. So let's download untrusted shit and run it off the internet, because reasons.
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
ln -s -f ~/github/dotfiles/vim-puppet ~/.vim/bundle/puppet

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
ln -s -f ~/github/dotfiles/tmux-submodule/.tmux.conf ~/.tmux.conf

# This file is not in the submodule, this is where I store my overrides.
ln -s -f ~/github/dotfiles/tmux/.tmux.conf.local ~/.tmux.conf.local

# Teamocil
gem install teamocil
ln -s -f ~/github/dotfiles/teamocil ~/.teamocil

# Sprinkle a little bash on it...
cd ~/github/dotfiles/powerline-shell
./install.py
ln -s -f ~/github/dotfiles/powerline-shell/powerline-shell.py ~/powerline-shell.py

# Link in my custom bash profiles.
ln -s -f ~/github/dotfiles/bash/.bash_profile ~.bash_profile
