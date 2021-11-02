#!/usr/bin/env sh

cd ~

DEV=~/Documents/Developments

# brew
if ! command -v brew &> /dev/null
then
    echo "BREW could not be found"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install node
brew install archey
brew install oathtool
brew install oath-toolkit
brew install bitwarden-cli
brew install fzf
brew install tree
brew install watch
brew install kafkacat
brew install zstd
brew install htop
brew tap lintingzhen/tap
brew install commitizen-go
brew install gitleaks
brew install pre-commit
brew install pyenv pyenv-virtualenv k3d helm helmfile kubectx
brew install pip
brew install kubectl
brew install azure-cli
brew install bat
brew  tap  homebrew/cask-fonts
brew install --cask font-hack-nerd-font
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
brew install postgresql
brew install sbt
brew install scala
brew install sbt
brew install graphviz
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew install bleunlock
brew install k9s
brew install golangci-lint

# nvm
if ! command -v nvm &> /dev/null
then
    echo "NVM could not be found"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
fi
nvm install v14.8.0

# ssh
ssh-keygen -t rsa -b 4096 -C "jtbonhomme@gmail.com"
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa
echo "Add this key to github SSH keys"
cat ~/.ssh/id_rsa.pub
open https://github.com/settings/keys

cat << EOF > ~/.ssh/config
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa
EOF

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/jtbonhomme/dotfiles.git
rm .zshrc
ln -s /Users/jbonhomm/dotfiles/zshrc .zshrc
ln -s /Users/jbonhomm/dotfiles/gitconfig .gitconfig

compaudit | xargs chmod -R 755


curl -O ~/Downloads/go1.16.2.darwin-amd64.pkg https://golang.org/dl/go1.16.2.darwin-amd64.pkg
sudo installer -pkg ~/Downloads/go1.16.2.darwin-amd64.pkg -target /
rm ~/Downloads/go1.16.2.darwin-amd64.pkg

mkdir -p ~/Documents/Developments/golang/src
mkdir -p ~/Documents/Developments/golang/bin
mkdir -p ~/Documents/Developments/golang/pkg

cat << EOF > ~/.devrc
export DEV=~/Documents/Developments
EOF


mkdir -p ~/Documents/Developments/golang/src

# downloads
# iterm
curl -o ~/Downloads/iTerm2-3_4_4.zip https://iterm2.com/downloads/stable/iTerm2-3_4_4.zip
unzip ~/Downloads/iTerm2-3_4_4.zip -d /Applications
#rm ~/Downloads/iTerm2-3_4_4.zip

# aws cli
curl -o ~/Downloads/AWSCLIV2.pkg https://awscli.amazonaws.com/AWSCLIV2.pkg
sudo installer -pkg ~/Downloads/AWSCLIV2.pkg  -target /
#rm ~/Downloads/AWSCLIV2.pkg

# docker
curl -o ~/Downloads/Docker.dmg https://desktop.docker.com/mac/stable/Docker.dmg

# Caffeine.app
curl -o ~/Downloads/Caffeine.dmg https://github.com/IntelliScape/caffeine/releases/download/1.1.3/Caffeine.dmg
# Conduktor.app
curl -o ~/Downloads/Conduktor-2.18.5.pkg https://github.com/conduktor/builds/releases/download/v2.18.5/Conduktor-2.18.5.pkg
sudo installer -pkg ~/Downloads/Conduktor-2.18.5.pkg  -target /

# DataGrip.app
curl ~/Downloads/datagrip-2021.2.4.dm https://download.jetbrains.com/datagrip/datagrip-2021.2.4.dmg?_gl=1*ouoe2p*_ga*MzQ4MTc5MTAzLjE2MzU4NDEyMjA.*_ga_V0XZL7QHEB*MTYzNTg0MTIxOS4xLjEuMTYzNTg0MTIzMS4w&_ga=2.128536780.1711659072.1635841220-348179103.1635841220
# Dropbox.app
open https://www.dropbox.com/fr/downloading
# Google Chrome.app
# Itsycal.app
curl -o ~/Downloads/Itsycal.zip  https://itsycal.s3.amazonaws.com/Itsycal.zip
unzip ~/Downloads/Itsycal.zip -d /Applications
# Miro.app
curl -o ~/Downloads/Miro.dmg https://desktop.miro.com/platforms/darwin/Miro.dmg
# Notion.app
curl -o ~/Downloads/Notion.dmg https://desktop-release.notion-static.com/Notion-2.0.19.dmg
# Pritunl.app
# Visual Studio Code.app
open https://code.visualstudio.com/Download

## APP STORE
# WhatsApp.app 
# Clipboard.app
# Todoist.app
# Magnet.app
# Slack.app
# Bitwarden.app



# At the end

source ~/.zshrc

