#███████╗░██████╗██╗░░██╗██████╗░░█████╗░
#╚════██║██╔════╝██║░░██║██╔══██╗██╔══██╗
#░░███╔═╝╚█████╗░███████║██████╔╝██║░░╚═╝
#██╔══╝░░░╚═══██╗██╔══██║██╔══██╗██║░░██╗
#███████╗██████╔╝██║░░██║██║░░██║╚█████╔╝
#╚══════╝╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░


# COMPLETION
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files
source $ZDOTDIR/completion.zsh


# PROMPT STYLE
#fpath=($ZDOTDIR/prompt $fpath)
#autoload -Uz prompt_purification_setup; prompt_purification_setup

fpath=($ZDOTDIR/pure $fpath)
autoload -U promptinit; promptinit
prompt pure


# GENERAL ALIASES
alias ll="ls -al"
alias ls="ls -p"
alias ..="cd .."


# ZSH DIRECTORY STACK
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.


# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# PLUGINS
fpath=($ZDOTDIR/plugins $fpath)
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# FLUTTER
export PATH="$PATH:$HOME/gitClones/flutter/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable"


# VI MODE
bindkey -v
export KEYTIMEOUT=1
autoload -Uz cursor_mode; cursor_mode  # change cursor type

# hdmi audio output alias
alias hao="pactl set-card-profile 0 output:hdmi-stereo"

# set keyboard "speed"
xset r rate 300 50

# change keyboard layout
alias italian="setxkbmap it"
alias dvorak="setxkbmap dvorak"

# reverse search
bindkey -v
bindkey '^r' history-incremental-search-backward

