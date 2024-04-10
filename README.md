# dotfiles
Personal repository to store config files

## App to install 
```sh
> sudo pacman -S  playerctl sysstat acpi gnome-flashback zsh nvim tmux alacritty kitty picom xclip
```

 - For hyprland 
```sh
> sudo pacman -S swaync blueman network-manager-applet wofi hyprland hypridle hyprlock xdg-desktop-portal-hyprland kenshi wlogout waybar 
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
