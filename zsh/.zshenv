export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export HISTFILE="$ZDOTDIR/.zshhistory"   # History file path
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

export EDITOR="nvim"
export VISUAL="nvim"

export LIBVA_DRIVER_NAME=iHD
export MOZ_DISABLE_RDD_SANDBOX=1
export MOZ_X11_EGL=1
# export MOZ_ENABLE_WAYLAND=1
. "$HOME/.cargo/env"
export PATH="$HOME/development/flutter/bin:$PATH"

export NVM_DIR="$HOME/.config/nvm" 
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
