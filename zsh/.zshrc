autoload -U colors && colors

setopt multios
setopt prompt_subst

unsetopt flowcontrol

setopt auto_menu
setopt complete_in_word
setopt always_to_end

setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
setopt autocd

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

setopt menu_complete
setopt no_list_ambiguous
autoload -Uz compinit
compinit
zstyle ':completion:*' menu yes select

setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY

# Window title
precmd () {
  print -Pn "\e]0; %n@%m: %~\a"
}

# Aliases
alias ls="ls -Gh"
alias ll="ls -alGh"
alias nano="nano -m"
alias grep="grep --exclude-dir=node_modules --exclude-dir=venv"
alias pip="pip3"
alias python="python3"
