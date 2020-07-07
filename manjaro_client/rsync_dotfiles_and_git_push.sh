#!/bin/bash - 

#rsync dotfiles
bash ~/.scripts/rsync_dotfiles.sh
#add, commit and push
git -C ~/Documents/dotfiles add .
git -C ~/Documents/dotfiles commit -m 'Weekly automatic update'
git -C ~/Documents/dotfiles push
