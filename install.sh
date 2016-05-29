#!/usr/bin/env bash

# Author    Maik Ellerbrock
# Github    https://github.com/ellerbrock/
# Company   Frapsoft
# Twitter   @frapsoft
# Homepage  https://frapsoft.com
# Version   1.1.7
# License   MIT


# Information
# -----------
# Shell script to automate the installation steps provided in the tutorial

# Links
# -----
# - Tutorial:               https://github.com/ellerbrock/tutorial-fish-shell-setup-osx/
# - Homebrew Website:       http://brew.sh/
# - iTerm2 Website:         https://www.iterm2.com/
# - iTerm2 Colour Schemes:  http://iterm2colorschemes.com/
# - Fish Shell:             https://fishshell.com/
# - Fisherman:              http://fisherman.sh/
# - Powerline Fonts:        https://github.com/powerline/fonts


# Configuration
# -------------
HOMEBREW="https://raw.githubusercontent.com/Homebrew/install/master/install"
COLOUR_THEMES="https://github.com/mbadolato/iTerm2-Color-Schemes/tarball/master"


# Functions
# ---------

homebrew_install()
{
  echo "It seems you don't have Homebrew installed."
  echo
  read -p "Install Homebrew? (y/n) " -n 1 answere
  echo
  if [[ $answere == "y" || $answere == "Y" ]]; then
    ruby -e "$($HOMEBREW)"
  else
    echo "Sorry, for this automated Script we need Homebrew."
    echo "closing ..."
    exit 1
  fi
}


ascii_font()
{
  echo '    _____      __            __         ____  '
  echo '   / __(_)____/ /_     _____/ /_  ___  / / /  '
  echo '  / /_/ / ___/ __ \   / ___/ __ \/ _ \/ / /   '
  echo ' / __/ (__  ) / / /  (__  ) / / /  __/ / /    '
  echo '/_/ /_/____/_/ /_/  /____/_/ /_/\___/_/_/     '
  echo '                                              '
  echo '        awesome fish shell setup              '
  echo '                                              '
  echo '                                              '
}


# Execute the Shell Script
ascii_font

# Test if Homebrew is installed
test -x brew || homebrew_install

echo "updating Homebrew ..."
brew update
brew upgrade

read -p "Install iTerms2 ? (y/n) " -n 1 answere
echo
if [[ $answere == "y" || $answere == "Y" ]]; then
  brew install caskroom/cask/brew-cask
  brew cask install iterm2

  read -p "Download iTerm2 Colour Schemes ? (y/n) " -n 1 answere
  echo
  if [[ $answere == "y" || $answere == "Y" ]]; then
    curl -o $COLOUR_THEMES
  fi
fi


read -p "Install Fish Shell ? (y/n) " -n 1 answere
echo
if [[ $answere == "y" || $answere == "Y" ]]; then
brew install fish --HEAD

    read -p "Install Fisherman ? (y/n) " -n 1 answere
    echo
    if [[ $answere == "y" || $answere == "Y" ]]; then
      brew tap fisherman/tap
      brew install --HEAD fisherman
      echo "updating Fisher ...."
      fisher up

      read -p "Install useful Fisherman Plugins: z + bass ? (y/n) " -n 1 answere
      echo
      if [[ $answere == "y" || $answere == "Y" ]]; then
        echo "Installing Fisher Plugin z + bass"
        fisher z bass
      fi
    fi
fi


read -p "Install Powerline Fonts ? (y/n) " -n 1 answere
echo
if [[ $answere == "y" || $answere == "Y" ]]; then
  brew install git fontconfig
  cp /usr/local/etc/fonts/fonts.conf.bak /usr/local/etc/fonts/fonts.conf

  git clone https://github.com/powerline/fonts.git
  ./fonts/install.sh
fi


read -p "Install Budspencer Theme for the Fish Shell ? (y/n) " -n 1 answere
echo
if [[ $answere == "y" || $answere == "Y" ]]; then
  brew install --with-default-names gnu-sed
  fisher omf/theme-budspencer
  set -U budspencer_nogreeting
  set -U fish_key_bindings fish_vi_key_bindings
  fish_update_completions
fi

clear

echo "Setup finished"
echo "--------------"
echo
echo "For further information i recommend reading the Fish Shell Documentation"
echo

read -p "Should i open the Fish Shell Documentation for you ? (y/n) " -n 1 answere
echo
if [[ $answere == "y" || $answere == "Y" ]]; then
  open http://fishshell.com/docs/current/
fi

echo
echo "closing ..."
