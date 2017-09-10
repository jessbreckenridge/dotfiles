#!/bin/bash
cd ~
# VIM Awesome install, from git submodule: https://github.com/amix/vimrc.git
sh ~/github/dotfiles/vimrc/install_awesome_vimrc.sh
ln -s -f ~/github/dotfiles/vim/my_configs.vim ~/.vim_runtime

# Pathogen. This doesn't have a clean submodule install, it's a package manager. So let's download untrusted shit and run it off the internet, because reasons.
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

ln -s -f ~/github/dotfiles/vim-puppet ~/.vim/bundle/puppet

# Make tmux awesome...
ln -s -f ~/github/dotfiles/.tmux/.tmux.conf ~/.tmux.conf
# This file is not in the submodule, this is where I store my overrides.
ln -s -f ~/github/dotfiles/tmux/.tmux.conf.local ~/.tmux.conf.local
# Teamocil
gem install teamocil
ln -s -f ~/github/dotfiles/teamocil ~/.teamocil
# Sprinkle a little bash on it...
cd ~/powerline-shell
./install.py
ln -s -f ~/powerline-shell/powerline-shell.py ~/powerline-shell.py
ln -s -f ~/github/dotfiles/bash/.bash_profile ~.bash_profile
