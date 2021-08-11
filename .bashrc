#!/bin/bash -X
# Source global definitions
if [ -f /etc/bashrc ]; then
   source /etc/bashrc
fi


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
export CDPATH=$HOME/src:$HOME/go/src/github.com/openshift
export PATH=$GOPATH/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/bin:$ANDROID_TOOLS:$ANDROID_PLATFORM_TOOLS

# script dependencies
source /usr/share/git-core/contrib/completion/git-prompt.sh


# Aliases
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias git-br='git symbolic-ref HEAD --short'
alias grep='grep --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias mc='. /usr/libexec/mc/mc-wrapper.sh'
alias pomDir='while [ ! -e pom.xml ] && [ "/" != "$(pwd)" ]; do cd ..; done'
alias src='cd ${HOME}/src'
alias vi='nvim'
alias vim='nvim'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
alias tinyredhaturl='wget  https://url.corp.redhat.com/new?$1'
alias clip='xsel -i -b'
alias ap='ansible-playbook'
alias l='less'
alias t='task'
alias xclip='clip'
alias ag='agrind'


# Key Bindings
bind '"\t":menu-complete'


# Custom functions
source ~/src/dotfiles/single-function-programs.sh


# My special dotfile 
source ~/src/dotfiles/enginestart.sh
source ~/src/dotfiles/enginecurl.sh
source ~/src/dotfiles/jbosscli.sh
source ~/src/dotfiles/repogrep.sh
source ~/src/dotfiles/bash_symbols.sh
source ~/src/dotfiles/telegram.sh
source ~/src/dotfiles/todo.sh
source ~/src/dotfiles/gerrit_helpers.sh
source ~/src/dotfiles/jenkins_env_functions.sh
source ~/src/dotfiles/productivity.sh
source ~/src/dotfiles/rotter.sh
source ~/src/dotfiles/gcp.sh
source ~/src/dotfiles/bzcurl.sh
source ~/src/dotfiles/kubeconf.sh

source <(gh completion --shell bash)
source "$HOME/.cargo/env"
source <(oc completion bash)
