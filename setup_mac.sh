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
# displays
    # do not auto adjust brightness

chsh -s $(which zsh)
# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap sambadevi/powerlevel9k
# COMMAND LINE APPS
brew install kryptco/tap/kr stow python2 python3 speedtest-cli macvim neovim \
    fzf powerlevel9k zsh-syntax-highlighting

# pair krypton
kr pair
sleeptime=20
echo "Sleeping for $sleeptime seconds to allow for pairing"
sleep $sleeptime

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

# NEOVIM SETUP
pip3 install neovim
pip2 install neovim powerline-status

# CASKS
brew cask install lastpass alfred dropbox spectacle nightowl protonmail-bridge \
    signal appcleaner spotify dash iterm2 firefox

# APPSTORE APPS
# pages, numbers, keynote, xcode, any.do, caffeinated

# POWERLEVEL9K
# configure according to: https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#step-1-install-powerlevel9k
# Download/install powerline font. Set as iTerm2 font.
# https://github.com/powerline/fonts/blob/master/Meslo%20Dotted/Meslo%20LG%20M%20DZ%20Regular%20for%20Powerline.ttf
# iTerm2 Theme
# https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/3024%20Night.itermcolors

--------------------------------------------------------------------------------
# NEOVIM COMMANDS
# PlugInstall
# UpdateRemotePlugins
