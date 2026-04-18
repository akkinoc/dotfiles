setopt auto_cd
setopt hist_verify
setopt interactive_comments
setopt no_beep
setopt numeric_glob_sort
setopt share_history

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000
WORDCHARS="_"

autoload -Uz colors && colors
