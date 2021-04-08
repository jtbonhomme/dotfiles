# AWS exports
#source ~/.aws
source ~/.devrc

# NVM

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for script

# . /Users/jbonhomm/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
archey -c -o

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="mh"
#ZSH_THEME="blinks"
#ZSH_THEME="agnoster"
#ZSH_THEME="aussiegeek"
#ZSH_THEME="candy"
#ZSH_THEME="fino-time"
#ZSH_THEME="ys"

# current theme
ZSH_THEME="bira"
#ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# z
#. `brew --prefix`/etc/profile.d/z.sh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git z docker aws golang kubectl)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/X11/bin:/usr/local/share/npm/bin:$HOME/bin

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/Library/PostgreSQL/10/bin"

source ~/dotfiles/updateDotFiles.sh
export PATH="/usr/local/sbin:$PATH"

export GOPATH=$DEV/golang
export GOROOT=/usr/local/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export GO111MODULE=on
#export PATH=$(pyenv root)/shims:$PATH
#eval "$(pyenv init -)"
#pyenv local system

PATH="/Users/jbonhomm/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/jbonhomm/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/jbonhomm/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/jbonhomm/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/jbonhomm/perl5"; export PERL_MM_OPT;

echo "set nvm in .bashrc"
nvm alias default v14.8.0
nvm use v14.8.0

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

alias k=kubectl
