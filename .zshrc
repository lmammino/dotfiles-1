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

[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
zstyle ':completion:*:*:git:*' script ~/bin/.git-completion.sh

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

# include nvm
RPROMPT='%{$fg[red]%}nodejs-$(nvm_ls 'current')%{$fg[cyan]%} $(~/.gvm/bin/gvm-prompt)%{$reset_color%}%{$fg[magenta]%} $(~/.rvm/bin/rvm-prompt)$(~/bin/git_cwd_info.rb)%{$reset_color%}'
# include gvm go version
#RPROMPT='%{$fg[cyan]%} $(~/.gvm/bin/gvm-prompt)%{$reset_color%}%{$fg[magenta]%} $(~/.rvm/bin/rvm-prompt)$(~/bin/git_cwd_info.rb)%{$reset_color%}'
# rvm and git only
#RPROMPT='%{$fg[magenta]%} $(~/.rvm/bin/rvm-prompt)$(~/bin/git_cwd_info.rb)%{$reset_color%}'
[[ -s "/Users/dylan/.gvm/scripts/gvm" ]] && source "/Users/dylan/.gvm/scripts/gvm"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/dylan/.gvm/bin/gvm-init.sh" ]] && source "/Users/dylan/.gvm/bin/gvm-init.sh"
