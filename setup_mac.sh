#! /bin/zsh

# MANUAL UI CHANGES
# change touchpad settings:
    # tap to click
    # three finger drag in accessibility
# keyboard:
    # increase key repeat speed
    # decrease key repeat delay
    # map caps lock to escape
    # don't adjust keyboard in low light
    defaults write -g ApplePressAndHoldEnabled -bool false
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

# COMMAND LINE APPS
brew install stow python2 python3 speedtest-cli macvim neovim

# install dotfiles
cd ~
git clone git@github.com:kwaugh/.dotfiles.git
cd .dotfiles
stow config tmux vim ycm zsh
cd ~

# CONFIGURE GIT
git config --global alias.st status
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.co checkout
git config --global user.name "Keivaun Waugh"
git config --global user.email "git@keivaun.com"

brew cask install iterm2

# NEOVIM SETUP
pip3 install neovim
pip2 install neovim

# CASKS
brew cask install lastpass alfred dropbox spectacle nightowl protonmail-bridge
brew cask install signal appcleaner spotify dash

# APPSTORE APPS
# pages, numbers, keynote, xcode, any.do, caffeinated

# POWERLEVEL9K
# configure according to: https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#step-1-install-powerlevel9k
brew tap sambadevi/powerlevel9k
brew install powerlevel9k zsh-syntax-highlighting
pip install --user powerline-status

--------------------------------------------------------------------------------
# NEOVIM COMMANDS
# PlugInstall
# UpdateRemotePlugins
