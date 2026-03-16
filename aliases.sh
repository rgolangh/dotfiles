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
alias journal='nvim "/home/rgolan/obsidian/kasten/6-Main Notes/journal.md"'
alias bw="flatpak run --command=bw com.bitwarden.desktop"
alias gemini="node $HOME/gemini/gemini.js"

alias copy-offload-board='jira issue list -p MTV -q "labels in (mtv-copy-offload)"'
alias eco-engineering-cluster-board='jira issue list -p ECOPROJECT -q "labels in (eco-engineering-cluster)"'
alias jira-from-git='~/src/kubev2v/mtv-releng/scripts/jira-from-git.sh'
alias triage='~/src/kubev2v/forklift/cmd/vsphere-xcopy-volume-populator/.project/triage-offload-backlog.sh'
alias create-offload-ticket='~/src/kubev2v/forklift/cmd/vsphere-xcopy-volume-populator/.project/create-offload-ticket.sh'
