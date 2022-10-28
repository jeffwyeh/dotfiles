#!/bin/bash

read -p "Enter path to scripts repository [/home/$USER/Yehyeh-scripts]: " yehyehRepoPath
if [ -z $yehyehRepoPath ]
then
   yehyehRepoPath="/home/$USER/Yehyeh-scripts"
fi

echo Checking to see if $yehyehRepoPath exists...
if [ ! -d $yehyehRepoPath ]
then
   read -p "$yehyehRepoPath does not exist. Continue? (y/N) " -n 1 -r
   echo
   if [[ ! $REPLY =~ ^[Yy]$ ]]
   then
      [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # handle exits from shell or function but don't exit interactive shell
   fi
fi

echo Syncing scripts to $yehyehRepoPath...
rsync -azP --exclude="__pycache__" ~/.config/zsh/scripts $yehyehRepoPath
