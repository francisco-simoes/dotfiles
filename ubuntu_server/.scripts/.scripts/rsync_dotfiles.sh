#!/bin/bash - 

# sync dotfiles
sudo rsync -avP `cat ~/Documents/rsync_dotfiles.txt` ~/Documents/dotfiles
