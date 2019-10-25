# Bootstrap after zsh.

if [[ $SHELL = '/bin/zsh' ]]; then
    echo "Shell set to /bin/zsh, continuing..."
else
    echo "Shell is not zsh, run zsh_bootstrap.sh"
    exit 1
fi

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

# Install Iterm2
 brew cask install iterm2

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Reload everything
source ~/.zshrc

# Install P10k
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Install fonts
cp -a ../fonts/* ~/Libary/fonts/

# Install oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
cp ../files/zshrc ~/.zshrc
