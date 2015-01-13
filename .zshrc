source ~/.zshrc_aliases

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
HISTCONTROL=erasedups

autoload -U colors compinit promptinit
colors
compinit
promptinit

setopt PROMPT_SUBST
setopt AUTO_CD
setopt NO_CASE_GLOB  # set ignore case for ls etc
setopt AUTO_PUSHD
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'   # case insensitive completion for cd etc *N*

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

# show full history from line 1 or grep for something
h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }

# Save a smiley to a local variable if the last command exited with success.
local smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"
# set tmux colors on error
if [ "$TMUX" ]; then
  PROMPT='$(if [[ $? == '0' ]]; then $(tmux set status-left-bg "black"); else $(tmux set status-left-bg "red"); fi)
%~
${smiley} %{$reset_color%}'
else
  PROMPT='
%~
${smiley}  %{$reset_color%}'
fi

RPROMPT='%{$fg[magenta]%} $(~/.rvm/bin/rvm-prompt)$(~/bin/git_cwd_info.rb)%{$reset_color%}'

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
