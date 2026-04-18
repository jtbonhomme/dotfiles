#!/usr/bin/env sh

set -v
set -x

# Display all commands
# set -o xtrace

RED="\e[31m"
ENDCOLOR="\e[0m"

function _pause () {
    echo -e "Press ${RED}RETURN${ENDCOLOR} to continue ..."
    read -n
}

cd ~

# brew
echo -e "Install ${RED} homebrew ${ENDCOLOR}"
if ! command -v brew &> /dev/null
then
    echo "BREW could not be found"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo >> /Users/jbonhomm/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> /Users/jbonhomm/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv zsh)"
fi

_pause

echo -e "Press ${RED} brew programs ${ENDCOLOR}"
brew install node 
brew install archey4
brew install bitwarden
brew install bitwarden-cli 
brew install fzf 
brew install jq 
brew install tree 
brew install watch 
brew install htop 
brew tap lintingzhen/tap 
brew install gitleaks 
brew install pre-commit 
brew install pyenv pyenv-virtualenv 
brew install pip 
brew install wget 
brew tap homebrew/cask-fonts 
brew install --cask font-hack-nerd-font 

brew install romkatv/powerlevel10k/powerlevel10k 
#echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc 
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

brew install golangci-lint 
brew install goreleaser 
brew install uv 
brew install steampipe 
brew install --cask claude-code 
brew install asciinema 
brew install podman 
brew install --cask podman-desktop 

brew install mole 
#brew install direnv 
brew install dotenv 
brew install z
brew install gitleaks
_pause

echo -e "Install ${RED} nvm ${ENDCOLOR}"
# nvm 
if ! command -v nvm &> /dev/null then
    echo "NVM could not be found"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
fi
nvm install v25.9.0
_pause

echo -e "Install ${RED} Oh! My Zsh ${ENDCOLOR}"
# Oh My Zsh
cd
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
_pause

echo -e "Install ${RED} dotfiles ${ENDCOLOR}"
# Dotfiles
mkdir -p ~/Documents/Developments/golang/src/github.com/jtbonhomme
cd ~/Documents/Developments/golang/src/github.com/jtbonhomme
git clone https://github.com/jtbonhomme/dotfiles.git
cd
mv .zshrc .zshrc.sav
ln -s ~/Documents/Developments/golang/src/github.com/jtbonhomme/dotfiles/zshrc .zshrc
ln -s ~/Documents/Developments/golang/src/github.com/jtbonhomme/dotfiles/gitconfig .gitconfig
ln -s ~/Documents/Developments/golang/src/github.com/jtbonhomme/dotfiles/gitignore_global .gitignore_global
ln -s ~/Documents/Developments/golang/src/github.com/jtbonhomme/dotfiles/nanorc .nanorc
_pause


# Go
echo -e "Install ${RED} Golang ${ENDCOLOR}"
GOVERSION=1.26.2
ARCHI=darwin-arm64
curl -o ~/Downloads/go${GOVERSION}.${ARCHI}.pkg https://go.dev/dl/${GOVERSION}.${ARCHI}.pkg
sudo installer -pkg ~/Downloads/go${GOVERSION}.${ARCHI}.pkg -target /
rm ~/Downloads/go${GOVERSION}.${ARCHI}.pkg
_pause

mkdir -p ~/Documents/Developments/golang/src
mkdir -p ~/Documents/Developments/golang/bin
mkdir -p ~/Documents/Developments/golang/pkg

cat << EOF > ~/.devrc
export DEV=~/Documents/Developments
EOF

# downloads
echo -e "Install ${RED} other downloads ${ENDCOLOR}"
# iterm
ITERM2VERSION=3.6.9
curl -o ~/Downloads/iTerm2-${ITERM2VERSION}.zip https://iterm2.com/downloads/stable/iTerm2-${ITERM2VERSION}.zip
unzip ~/Downloads/iTerm2-${ITERM2VERSION}.zip -d /Applications
rm ~/Downloads/iTerm2-${ITERM2VERSION}.zip

# Caffeine.app
open https://www.caffeine-app.net/download/tahoe/

# Dropbox.app
open https://www.dropbox.com/fr/downloading

# Notion.app
open https://www.notion.com/desktop/mac-apple-silicon/download

# Visual Studio Code.app
open https://code.visualstudio.com/Download

## APP STORE
# WhatsApp.app 
# Clipboard.app
# Todoist.app
# Magnet.app
# Slack.app
# Bitwarden.app
# XCode

# Envmap
go install github.com/binsquare/envmap@latest
_pause

# At the end
echo -e "Source ${RED} ~/.zshrc ${ENDCOLOR}"
source ~/.zshrc

