#███████╗░██████╗██╗░░██╗██████╗░░█████╗░
#╚════██║██╔════╝██║░░██║██╔══██╗██╔══██╗
#░░███╔═╝╚█████╗░███████║██████╔╝██║░░╚═╝
#██╔══╝░░░╚═══██╗██╔══██║██╔══██╗██║░░██╗
#███████╗██████╔╝██║░░██║██║░░██║╚█████╔╝
#╚══════╝╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░

# --- HISTORY & SHELL OPTIONS ---
export HISTFILE="$ZDOTDIR/.zshhistory"
export HISTSIZE=10000
export SAVEHIST=10000

setopt AUTO_PUSHD           # Push current directory onto stack
setopt PUSHD_IGNORE_DUPS    # Ignore duplicates in stack
setopt PUSHD_SILENT         # Do not print directory stack on pushd/popd

# --- FPATH & COMPLETIONS ---
# Add prompt & plugin directories to fpath before compinit
fpath=($ZDOTDIR/pure $ZDOTDIR/plugins $fpath)

# Cached compinit initialization
autoload -U compinit
if [[ -n "$ZDOTDIR/.zcompdump"(N.m+1) ]]; then
  compinit
else
  compinit -C
fi

_comp_options+=(globdots) # Enable completion for hidden files

if [[ -f "$ZDOTDIR/plugins/completion.zsh" ]]; then
  source "$ZDOTDIR/plugins/completion.zsh"
fi

# --- PROMPT ---
autoload -U promptinit; promptinit
prompt pure

# --- VI MODE & KEYBINDINGS ---
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape based on vi mode (if script is present in fpath)
autoload -Uz cursor_mode 2>/dev/null && cursor_mode

# Reverse suggestion list with Shift-Tab
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Tmux sessionizer
bindkey -s ^f "$ZDOTDIR/plugins/tmux-sessionizer\n"

# --- ALIASES ---
alias ls="ls -p"
alias ll="ls -al"
alias ..="cd .."
alias vim="nvim"

# SSH alias (Renamed from 'zsh' to avoid overriding the shell executable)
alias szsh="TERM='xterm-256color' ssh"

# Keyboard Layout Toggles
alias aoeu="setxkbmap us"
alias asdf="setxkbmap -layout us -variant dvorak"

# --- FUNCTIONS ---
wifi-powersave-toggle() {
    local file="/etc/NetworkManager/conf.d/wifi-powersave.conf"

    if [ ! -f "$file" ]; then
        echo "Config not found, creating default (disabled)..."
        echo -e "[connection]\nwifi.powersave=2" | sudo tee "$file" >/dev/null
    fi

    local current
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
    local file="/etc/NetworkManager/conf.d/wifi-powersave.conf"
    echo "Config file: $file"
    grep wifi.powersave "$file"
}

# --- EXTERNAL PLUGINS & INTEGRATIONS ---
# FZF
if command -v fzf &>/dev/null; then
  source <(fzf --zsh)
fi

# Zsh Syntax Highlighting (Must be loaded LAST)
if [[ -f "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
