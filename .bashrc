#!/bin/bash -X
# Source global definitions
if [ -f /etc/bashrc ]; then
   source /etc/bashrc
fi

source ~/.bash_secrets

export TERM=xterm-256color
export GIT_EDITOR=nvim
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWUNTRACKEDFILES=1
export JAVA_HOME=/lib/jvm/java-16-openjdk
export BYTEMAN_HOME=/opt/byteman
export ANDROID_TOOLS=$HOME/android-development/android-sdk-linux/tools
export ANDROID_PLATFORM_TOOLS=$HOME/android-development/android-sdk-linux/platfom_tools
export GRAALVM_HOME=$HOME/graalvm-ce-java11-20.2.0
export PS1='[\u@\h \w$(__git_ps1 " (%s)")] \n$ '
export PAGER="less -S" psql
export GOPATH=${HOME}/go
export HISTCONTROL='ignoreboth' #  - ignoreboth = ignorespace and ignoredup
export REQUESTS_CA_BUNDLE=/etc/pki/tls/certs/ca-bundle.crt
export GOROOT=/usr/lib/golang
export PROMPT_DIRTRIM=2
export CDPATH=".":$HOME/src:$HOME/go/src/github.com/openshift
export PATH=$GOPATH/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/bin:$ANDROID_TOOLS:$ANDROID_PLATFORM_TOOLS

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

