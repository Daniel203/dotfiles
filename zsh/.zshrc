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
fpath=($ZDOTDIR/prompt $fpath)
autoload -Uz prompt_purification_setup; prompt_purification_setup


# DIRCOLORS
#eval "$(gdircolors -b $ZDOTDIR/dircolors)"
eval "$(gdircolors -b $ZDOTDIR/.dircolors/dircolors)"
alias ls="gls --color=auto"


# GENERAL ALIASES
alias ll="ls -al"
alias ..="cd .."


# ZSH DIRECTORY STACK
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index


# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# PLUGINS
fpath=($ZDOTDIR/plugins $fpath)


# VI MODE
bindkey -v
export KEYTIMEOUT=1
autoload -Uz cursor_mode; cursor_mode  # change cursor type

