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
rm ~/Downloads/iTerm2-3_4_4.zip

# aws cli
curl -o ~/Downloads/AWSCLIV2.pkg https://awscli.amazonaws.com/AWSCLIV2.pkg
sudo installer -pkg ~/Downloads/AWSCLIV2.pkg  -target /
rm ~/Downloads/AWSCLIV2.pkg

# docker
curl -o ~/Downloads/Docker.dmg https://desktop.docker.com/mac/stable/Docker.dmg

# At the end

source ~/.zshrc

