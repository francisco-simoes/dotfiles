#!/bin/bash - 

# pull from repo so that everything is up to date.
git -C ~/Documents/dotfiles pull
# sync general dotfiles using rsync_dotfiles_general.txt
rsync -avP `cat ~/Documents/rsync_dotfiles_general.txt` ~/Documents/dotfiles

# Create/update my-crontab file with the contents of crontab -e
crontab -l > /home/simoes/Documents/my-crontab
# sync dotfiles specific to the ubuntu server using rsync_dotfiles_ubuntu.txt
rsync -avP `cat ~/Documents/rsync_dotfiles_ubuntu.txt` ~/Documents/dotfiles/ubuntu_server
