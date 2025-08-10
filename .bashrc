#!/bin/bash -X
# Source global definitions
if [ -f /etc/bashrc ]; then
   source /etc/bashrc
fi

source ~/.bash_secrets

export TERM=xterm-256color
export EDITOR=nvim
export GIT_EDITOR=nvim
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWUNTRACKEDFILES=1
export JAVA_HOME=/lib/jvm/java-16-openjdk
export PS1='[\u@\h \w$(__git_ps1 " (%s)")] \n$ '
export PAGER="less -S" psql
export GOPATH=${HOME}/go
export HISTCONTROL='ignoreboth' #  - ignoreboth = ignorespace and ignoredup
export GOROOT=/usr/lib/golang
export PROMPT_DIRTRIM=2
export CDPATH=".":$HOME/src:$HOME/go/src/github.com/openshift
export PATH=$GOPATH/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/bin:$HOME/.local/bin

# script dependencies
source /usr/share/git-core/contrib/completion/git-prompt.sh

# Aliases - loaded from .bashrc.d/aliases.sh

# Key Bindings
bind '"\t":menu-complete'

source <(gh completion --shell bash)
source "$HOME/.cargo/env"
source <(oc completion bash)


# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

