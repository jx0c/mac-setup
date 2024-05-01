#!/bin/zsh

# Check for Homebrew and install it if it's not installed
if test ! $(which brew)
then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   # Add Homebrew to PATH in zsh
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$(whoami)/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update and upgrade Homebrew
brew update
brew upgrade

# Install packages
brew install git
brew install node
brew install python3

# Install Oh-My-Zsh
echo "Installing Oh-My-Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Wait for Oh-My-Zsh installation to complete
echo "Waiting for Oh-My-Zsh installation to complete..."
sleep 5

# Change default shell to Zsh
echo "Changing default shell to Zsh..."
chsh -s $(which zsh)

# Install Powerlevel10k
echo "Installing Powerlevel10k theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Set Zsh theme to powerlevel10k in the .zshrc
sed -i '' 's/^ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# Install Meslo Nerd Font
echo "Installing Meslo Nerd Font..."
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font

# Source the .zshrc to reflect changes
source ~/.zshrc

zecho "installing rosetta for flutter"
sudo softwareupdate --install-rosetta --agree-to-license

echo "Installing vscode"
brew install --cask visual-studio-code

# Refresh shell environment
source ~/.zprofile

brew doctor
echo "Setup complete!"


