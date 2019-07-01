#! /bin/zsh

--------------------------------------------------------------------------------
# MANUAL UI CHANGES
# change touchpad settings:
    # tap to click
    # three finger drag in accessibility
# keyboard:
    # increase key repeat speed
    # decrease key repeat delay
    # map caps lock to escape
    # don't adjust keyboard in low light
# mission control:
    # don't automatically rearrange Spaces based on most recent use
# dock
    # auto hide
    # add applications and documents to dock
    # display everything as folder and grid
# internet accounts
    # add gmail
# battery
    # show battery percentage in statusbar
# login items
    # which applications start at boot

chsh -s $(which zsh)
# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# install Krypton
curl https://krypt.co/kr | sh
kr pair
# prepare for dotfiles
brew install stow
cd ~
# install dotfiles
git clone git@github.com:kwaugh/.dotfiles.git
cd .dotfiles
stow config tmux vim ycm zsh
cd ~
# configure git
git config --global alias.st status
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.co checkout
git config --global user.name "Keivaun Waugh"
git config --global user.email "git@keivaun.com"

brew cask install iterm2
# coding languages
brew install python2 python3
# text editors
brew install macvim neovim
pip3 install neovim
pip2 install neovim

# casks
brew cask install lastpass alfred dropbox spectacle nightowl protonmail-bridge
brew cask install signal

# APPSTORE APPS
# pages, numbers, keynote, xcode, any.do, caffeinated

# POWERLEVEL9K
# configure according to: https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#step-1-install-powerlevel9k

--------------------------------------------------------------------------------
# NEOVIM COMMANDS
# PlugInstall
# UpdateRemotePlugins
