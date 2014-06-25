#!/bin/zsh

savPwd=`pwd`

cd ~/dotfiles

currentHash=`git log -n 1 --pretty=format:"%H"`
remoteHash=`git ls-remote --heads -q|awk '{print $1}'`

if [ "$remoteHash" != "$currentHash" ]
then
  echo "[$fg_bold[red]My Dotfiles$reset_color] Would you like to get updates ?"
  echo "Type $fg_bold[blue]Y$reset_color to update : \c"
  read line
  if [ "$line" = Y ] || [ "$line" = y ]; then
    git pull
  fi
fi

cd $savPwd
