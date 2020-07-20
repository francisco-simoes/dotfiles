#### This includes the commands to personalize Manjaro Awesome edition to my liking.

# First things first
pacman -Syu #Updates all packages.
pacman -S neovim #Get the best text editor ;)
pacman -S neofetch #Simple program to get system info.
mv ~/.config/rofi ~/.config/rofi_ #Rofi comes with an issue, best solved by renaming config file/folder.
sed --in-place=_backup 's/#Color/Color/' /etc/pacman.conf #Enable coloring on pacman prints.
pacman -S yay #Get the best AUR wrapper.
yay -S luke-st-git #Install Luke Smith's version of suckless's simple terminal (st).
pacman -S dmenu #necessary for some st funcitonalities.
yay -S ytop #Great terminal graphical system monitor.


##############################
# Dotfiles and configs
#Pull from Github repo:
mkdir ~/Documents/dotfiles
git clone https://github.com/francisco-simoes/dotfiles ~/Documents/dotfiles

## AwesomeWM
#Backup awesome's config and tweak a few things.
mv ~/.config/awesome/rc.lua ~/.config/awesome/rc.lua_backup #Create backup of the config file.
mv -R /usr/share/awesome/themes ~/.config/awesome/themes #Copy all default themes to awesomes's config dir.
mkdir ~/Pictures/Wallpapers
cp -R /usr/share/backgrounds/manjaro-wallpapers-18.0 ~/Pictures/Wallpapers/manjaro18 #Copy manjaro wallpapers to created folder.
#Set Logo as Manjaro logo, as in the cesious theme.
cp ~/awesome/themes/cesious/icons/manjaro64.png ~/awesome/themes/default/manjaro64.png
#Get config files
cp ~/Documents/dotfiles/manjaro_client/rc.lua ~/.config/awesome
cp ~/Documents/dotfiles/manjaro_client/theme.lua ~/.config/awesome/themes/default

## Neovim
mkdir ~/.config/nvim
cp ~/Documents/dotfiles/init.vim ~/.config/nvim/init.vim
pacman -S xclip #Needed to be able to copy to system's clipboard.
#Install vim-plug:
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#Install nodejs and npm for coc-vim and coc-python:
pacman -S nodejs npm #If this fails, do `curl -sL install-node.now.sh/lts | bash` as suggested on github.
lxterminal --command 'nvim "+CocInstall coc-python"' #Installs coc-python. Assumes you have lxtermial.

## Ranger
mkdir ~/.config/ranger
cp ~/Documents/dotfiles/ranger/rc.conf ~/.config/ranger
cp ~/Documents/dotfiles/ranger/rifle.conf ~/.config/ranger
cp ~/Documents/dotfiles/ranger/scope.sh ~/.config/ranger

## Zathura
mkdir ~/.config/zathura
cp ~/Documents/dotfiles/zathurarc ~/.config/zathura

## zsh
mv ~/.zshrc ~/.zshrc_backup
cp ~/Documents/dotfiles/zsh/.zshrc ~/.zshrc

## .Xresources, used to customize simple terminal.
cp ~/Documents/dotfiles/manjaro_client/.Xresources ~

## Dotfile backups with rsync
mkdir ~/.scripts
cp ~/Documents/dotfiles/manjaro_client/rsync_dotfiles.sh ~/.scripts
cp ~/Documents/dotfiles/manjaro_client/rsync_dotfiles_and_git_push.sh ~/.scripts
cp ~/Documents/dotfiles/manjaro_client/rsync_dotfiles_zsh.txt ~/Documents
cp ~/Documents/dotfiles/manjaro_client/rsync_dotfiles_ranger.txt ~/Documents
cp ~/Documents/dotfiles/manjaro_client/rsync_dotfiles_manjaro.txt ~/Documents
cp ~/Documents/dotfiles/manjaro_client/rsync_dotfiles_general.txt ~/Documents

##############################

# Miscellaneous software
pacman -S screenkey
pacman -S bluez-utils #Installs bluetoothctl and others.
yay -S zoom
pacman -S w3m #To view images in ranger.
yay -S bfg #To delete files across entire git history.
yay -S rstudio-desktop-bin
