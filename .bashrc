#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias phone='ssh -p 8022 u0_a422@192.163.43.1'
alias apt='pacman'
alias install='-S'
alias ide='bash ide.sh'


PS1='[\u@\h \W]\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

exec zsh

