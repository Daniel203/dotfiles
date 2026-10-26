# --- XDG DIRECTORIES ---
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# --- DEFAULT APPLICATIONS ---
export EDITOR="nvim"
export VISUAL="nvim"

# --- PATH & ENVIRONMENT VARIABLES ---
# User Local Bins
export PATH="$HOME/.local/bin:$PATH"

# Java
export JAVA_HOME="/usr/lib/jvm/default"
export PATH="$JAVA_HOME/bin:$PATH"

# Flutter
export PATH="$PATH:$HOME/Tools/flutter/bin"
export PATH="$PATH:$HOME/.pub-cache/bin"
export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable"

# Rust / Cargo
export PATH="$PATH:$HOME/.cargo/bin"

# Ruby
export PATH="$PATH:$HOME/.config/local/share/gem/ruby/3.4.0/bin"

# Hardware / Driver / App Flags
# export LIBVA_DRIVER_NAME=iHD
# export VDPAU_DRIVER=va_gl
# export LIBVA_DRIVER_NAME=radeonsi
# export VDPAU_DRIVER=radeonsi
export MOZ_DISABLE_RDD_SANDBOX=1
export MOZ_X11_EGL=1
export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/docker.sock"
