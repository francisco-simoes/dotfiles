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

# Tweak awesome's config
cp ~/.config/awesome/rc.lua ~/.config/awesome/rc.lua_backup #Create backup of the config file.
cp -R /usr/share/awesome/themes ~/.config/awesome/themes #Copy all default themes to awesomes's config dir.
#sed --in-place 's#beautiful.init("~/.config/awesome/themes/cesious/theme.lua")#beautiful.init("~/.config/awesome/themes/default/theme.lua")#' ~/.config/awesome/rc.lua #Use default theme instead of cesious theme.
mkdir ~/Pictures/Wallpapers
cp -R /usr/share/backgrounds/manjaro-wallpapers-18.0 ~/Pictures/Wallpapers/manjaro18 #Copy manjaro wallpapers to created folder.
#sed --in-place 's#theme.wallpaper = themes_path.."default/background.png"#theme.wallpaper = "~/Pictures/Wallpapers/manjaro18/illyria-default2.jpg"#' ~/.config/awesome/themes/default/theme.lua #Change wallpaper to a nice one from manjaro18.
#sed --in-place 's#properties = { titlebars_enabled = true }#properties = { titlebars_enabled = false }#' ~/.config/awesome/rc.lua #Disable title bars.
#sed --in-place 's/theme.border_focus  = "#535d6c"/theme.border_focus  = "#00FF00"/' ~/.config/awesome/themes/default/theme.lua #Change active border's color to lime. 
#sed --in-place 's/theme.border_width  = dpi(1)/theme.border_width  = dpi(2)/' ~/.config/awesome/themes/default/theme.lua #Makes border thicker.
#sed --in-place 's/theme.fg_focus      = "#ffffff"/theme.fg_focus    = "#00FF00"/' ~/.config/awesome/themes/default/theme.lua #Changes font color to lime in tags.
#sed --in-place 's/theme.border_normal = "#000000"/theme.border_normal = "#454545"/' ~/.config/awesome/themes/default/theme.lua #Changes borders of unfocused windows to gray.
## Set Logo as Manjaro logo, as in the cesious theme.
cp ~/awesome/themes/cesious/icons/manjaro64.png ~/awesome/themes/default/manjaro64.png
#sed --in-place '123d' ~/.config/awesome/themes/default/theme.lua
#sed --in-place '122d' ~/.config/awesome/themes/default/theme.lua
#sed --in-place '121d' ~/.config/awesome/themes/default/theme.lua
#sed --in-place '121i theme.awesome_icon = "~/.config/awesome/themes/default/manjaro64.png"' ~/.config/awesome/themes/default/theme.lua
## Add keybinding to toggle wibar visibility.
#sed --in-place '266i -- START (simoes)' ~/.config/awesome/rc.lua
#sed --in-place '267i awful.key({ modkey }, ";", function ()' ~/.config/awesome/rc.lua
#sed --in-place '268i myscreen = awful.screen.focused()' ~/.config/awesome/rc.lua
#sed --in-place '269i myscreen.mywibox.visible = not myscreen.mywibox.visible' ~/.config/awesome/rc.lua
#sed --in-place '270i end,' ~/.config/awesome/rc.lua
#sed --in-place '271i {description = "toggle statusbar"}' ~/.config/awesome/rc.lua
#sed --in-place '272i ),' ~/.config/awesome/rc.lua
#sed --in-place '273i -- END (simoes)' ~/.config/awesome/rc.lua
## Comment out useless layouts.
#sed --in-place 's/awful.layout.suit.fair.horizontal,/--awful.layout.suit.fair.horizontal,/' ~/.config/awesome/rc.lua 
#sed --in-place 's/awful.layout.suit.floating,/--awful.layout.suit.floating/' ~/.config/awesome/rc.lua 

# Dotfiles and config
#Pull from Github repo:
mkdir ~/Documents/dotfiles
git clone https://github.com/francisco-simoes/dotfiles ~/Documents/dotfiles
## Neovim
mkdir ~/.config/nvim
cp ~/Documents/dotfiles/init.vim ~/.config/nvim/init.vim
pacman -S xclip #Needed to be able to copy to system's clipboard.
#Install vim-plug:
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#Install nodejs and npm for coc-vim and coc-python:
pacman -S nodejs npm #If this fails, do `curl -sL install-node.now.sh/lts | bash` as suggested on github.
lxterminal --command 'nvim "+CocInstall coc-python"' #Installs coc-python. Assumes you have lxtermial.
## zsh
mv ~/.zshrc ~/.zshrc_backup
cp ~/Documents/dotfiles/.zshrc ~/.zshrc
## .Xresources, used by simple terminal.
mv ~/Documents/dotfiles/manjaro_client/.Xresources ~

# Miscellaneous software
pacman -S screenkey
pacman -S bluez-utils #Installs bluetoothctl and others.
yay -S zoom
pacman -S w3m #To view images in ranger.
yay -S bfg #To delete files across entire git history.
