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
export VDPAU_DRIVER=va_gl
export MOZ_DISABLE_RDD_SANDBOX=1
export MOZ_X11_EGL=1
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# JAVA
export JAVA_HOME=/usr/lib/jvm/java-18-openjdk
export PATH=$JAVA_HOME/bin:$PATH
