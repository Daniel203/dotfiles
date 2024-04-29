# dotfiles
Personal repository to store config files

## App to install 
```sh
> sudo pacman -S  playerctl sysstat acpi blueman gnome-flashback zsh neovim tmux alacritty kitty picom xclip npm telegram-desktop
```

 - For hyprland 
```sh
> sudo pacman -S swaync blueman network-manager-applet wofi hyprland hypridle hyprlock xdg-desktop-portal-hyprland kanshi brightnessctl
> paru -S wdisplays
```

 - Visualize volume/brightness change
```sh
> paru -S swayosd-git
> sudo systemctl enable --now swayosd-libinput-backend.service 
```

## Suggested commands

Set global dark theme
```sh
> gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
> gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
```


## In case I would use ags
```sh 
> yay -S aylurs-gtk-shell 
> sudo npm install -g sass bun
> sudo pacman -S fd ttf-ubuntu-mono-nerd nwg-look
> paru -S matugen morewaita swww hyprpicker
```

Use nwg-look to set the default icon pach to morewaita

## Auto snapshot
```sh
> sudo pacman -S grub-btrfs
> yay -S timeshift-autosnap 
> sudo systemctl start grub-btrfsd
> sudo systemctl enable grub-btrfsd
```sh

Edit the process files
```sh
> sudo systemctl edit --full grub-btrfsd 
```
`ExecStart=/usr/bin/grub-btrfsd --syslog --timeshift-auto`
