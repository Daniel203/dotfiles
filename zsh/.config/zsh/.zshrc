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


# VI MODE
bindkey -v
export KEYTIMEOUT=1
autoload -Uz cursor_mode; cursor_mode  # change cursor type

# hdmi audio output alias
alias hao="pactl set-card-profile 0 output:hdmi-stereo"

# set keyboard "speed"
xset r rate 300 50
