#!/bin/bash - 

# pull from repo so that everything is up to date.
git -C ~/Documents/dotfiles pull
# sync general dotfiles using rsync_dotfiles_general.txt
rsync -avP `cat ~/Documents/rsync_dotfiles_general.txt` ~/Documents/dotfiles

# sync general zsh dotfiles using rsync_dotfiles_zsh.txt
rsync -avP `cat ~/Documents/rsync_dotfiles_zsh.txt` ~/Documents/dotfiles/zsh

# sync general ranger dotfiles using rsync_dotfiles_ranger.txt
rsync -avP `cat ~/Documents/rsync_dotfiles_ranger.txt` ~/Documents/dotfiles/ranger

# Create/update my-crontab file with the contents of crontab -e
crontab -l > /home/simoes/Documents/my-crontab
# sync dotfiles specific to the manjaro client using rsync_dotfiles_manjaro.txt
rsync -avP `cat ~/Documents/rsync_dotfiles_manjaro.txt` ~/Documents/dotfiles/manjaro_client
