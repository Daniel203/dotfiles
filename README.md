# dotfiles
Personal repository to store config files

## App to install 
```sh
> sudo pacman -S  playerctl sysstat acpi blueman gnome-flashback zsh neovim tmux alacritty kitty picom xclip npm telegram-desktop intel-media-driver mpv zathura
> paru -S librewolf
```

 - For hyprland 
```sh
> sudo pacman -S swaync blueman network-manager-applet wofi hyprland hypridle hyprlock kanshi brightnessctl xdg-desktop-portal-gtk     
> paru -S nwg-displays
> paru -S xdg-desktop-portal-hyprland-git
> paru -S hyprsunset
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
```
Edit the process files
```sh
> sudo systemctl edit --full grub-btrfsd 
```
`ExecStart=/usr/bin/grub-btrfsd --syslog --timeshift-auto`

## Problems with screen share
``` 
> systemctl --user status pipewire wireplumber
```
In case enable and start
