# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# AWS exports
#source ~/.aws
source ~/.devrc

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for script

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
archey

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
#ZSH_THEME="bira"

# current theme
ZSH_THEME="powerlevel10k/powerlevel10k"


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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git z docker aws golang kubectl dotenv)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/X11/bin
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
export PATH="/usr/local/sbin:$PATH"

#source ~/dotfiles/updateDotFiles.sh

export GOPATH=$DEV/golang
export GOROOT=/usr/local/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export GO111MODULE=on

# ???
#export PATH=$(pyenv root)/shims:$PATH
#eval "$(pyenv init -)"
#pyenv local system

# PERL 
PATH="/Users/jbonhomm/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/jbonhomm/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/jbonhomm/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/jbonhomm/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/jbonhomm/perl5"; export PERL_MM_OPT;

echo "set nvm in .bashrc"
nvm alias default v25.9.0
nvm use v25.9.0

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

alias k=kubectl

function token() {
    node -p 'require("crypto").randomUUID()'
}


# Export Bitwarden unlocking Vault session key
export BW_SESSION="PUT-YOUR-TOKEN-HERE"


function bwLogin() {
    passwd=$(bw get password SERVICE-NAME)
    totp=$(oathtool --base32 --totp TOTP-TOKEN)
}


function gorep() {
    if [[ $1 == "" ]]
    then
        echo usage: gorep string_to_replace replacement_string
        return 1
    fi
    if [[ $2 == "" ]]
    then
        echo usage: gorep string_to_replace replacement_string
        return 2
    fi
    for i in $(ls **/*.go)
    do
        echo "processing $i to replace $1 with $2 ..."
        cat $i |sed "s/$1/$2/g">/tmp/tmp.go
        cp /tmp/tmp.go $i
    done
}

#eval "$(pyenv init -)"

alias code="/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron"


function ggrep() {
	grep -n $1 **/*.go
}

function sgrep() {
	grep -n $1 **/*.scala
}

function ygrep() {
        grep -n -R --include="*.gotmpl" --include="*.yaml" --include="*.yml" $1
}

function tgrep() {
        grep -n -R --include="*.tf" --include="*.tfvars" $1
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$HOME/.local/bin:$PATH"
