#!/bin/bash

function record() {
    asciinema rec -i 0.2 "$@"
}

# Aliases
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias git-br='git symbolic-ref HEAD --short'
alias grep='grep --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto --hyperlink'
alias mc='. /usr/libexec/mc/mc-wrapper.sh'
alias pomDir='while [ ! -e pom.xml ] && [ "/" != "$(pwd)" ]; do cd ..; done'
alias src='cd ${HOME}/src'
alias vi='nvim'
alias vim='nvim'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
alias clip='xsel -i -b'
alias ap='ansible-playbook'
alias less='less -R'
alias t='task'
alias xclip='clip'
alias ag='agrind'
alias diff='diff --color'


