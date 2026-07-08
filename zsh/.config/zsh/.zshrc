#███████╗░██████╗██╗░░██╗██████╗░░█████╗░
#╚════██║██╔════╝██║░░██║██╔══██╗██╔══██╗
#░░███╔═╝╚█████╗░███████║██████╔╝██║░░╚═╝
#██╔══╝░░░╚═══██╗██╔══██║██╔══██╗██║░░██╗
#███████╗██████╔╝██║░░██║██║░░██║╚█████╔╝
#╚══════╝╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░


# COMPLETION
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files
source $ZDOTDIR/plugins/completion.zsh


# STYLE
fpath=($ZDOTDIR/pure $fpath)
autoload -U promptinit; promptinit
prompt pure


# ALIASES
alias ll="ls -al"
alias ls="ls -p"
alias ..="cd .."
alias zsh="TERM='xterm-256color' ssh"
alias loadconda='source /opt/miniconda3/etc/profile.d/conda.sh'

# hdmi audio output alias
alias hao="pactl set-card-profile 0 output:hdmi-stereo"

# change keyboard layout
alias aoeu="setxkbmap us"
alias asdf="setxkbmap -layout us -variant dvorak"


# ZSH DIRECTORY STACK
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.


# FZF
source <(fzf --zsh)


# PLUGINS
fpath=($ZDOTDIR/plugins $fpath)
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$PATH:$ZDOTDIR/plugins"


# FLUTTER
export PATH="$PATH:$HOME/gitClones/flutter/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable"

# RUST
export PATH="$PATH:$HOME/.cargo/bin/"

# VI MODE
bindkey -v
export KEYTIMEOUT=1
autoload -Uz cursor_mode; cursor_mode  # change cursor type

# RUBY
export PATH="$PATH:$HOME/.config/local/share/gem/ruby/3.4.0/bin"

# set keyboard "speed"
xset r rate 300 50

# reverse search
bindkey -v

# tmux-sessionizer
bindkey -s ^f "tmux-sessionizer\n"

# reverse the suggestion list with S-Tab
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Hyprlock 
export PATH="$HOME/.local/bin:$PATH"


# Toggle wifi powersave mode
wifi-powersave-toggle() {
    file="/etc/NetworkManager/conf.d/wifi-powersave.conf"

    if [ ! -f "$file" ]; then
        echo "Config not found, creating default (disabled)..."
        echo -e "[connection]\nwifi.powersave=2" | sudo tee "$file" >/dev/null
    fi

    current=$(grep -oP 'wifi\.powersave\s*=\s*\K[0-9]' "$file")

    if [ "$current" = "2" ]; then
        echo "Switching Wi-Fi power save → ENABLED (3)"
        sudo sed -i 's/wifi.powersave=2/wifi.powersave=3/' "$file"
    else
        echo "Switching Wi-Fi power save → DISABLED (2)"
        sudo sed -i 's/wifi.powersave=3/wifi.powersave=2/' "$file"
    fi

    sudo systemctl restart NetworkManager
}

wifi-powersave-status() {
    file="/etc/NetworkManager/conf.d/wifi-powersave.conf"
    echo "Config file: $file"
    grep wifi.powersave "$file"
}

