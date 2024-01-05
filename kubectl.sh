#!/bin/bash

export KUBECONFIG="/var/home/rgolan/.kube/config"
KUBECONFIG+=":/var/home/rgolan/clusters/hub-helios04/ocp-dev-cluster/my-cluster/auth/kubeconfig"
KUBECONFIG+=":/var/home/rgolan/clusters/kind/kubeconfig"

source <(kubectl completion bash)
alias k='kubectl'
complete -F __start_kubectl k

function ns() {
    if [ -z "$1" ]; then
        kubectl config view --minify -o jsonpath='{..namespace}{"\n"}'
        return
    fi
    kubectl config set-context --current --namespace "${1}"
}

# inspired and learned a lot from this article - https://opensource.com/article/18/3/creating-bash-completion-script
_ns_completions() {
    # no need to try to complete if we already have a namespace - e.g 'ns somenamespace <tab> <tab>'
    if [ "${#COMP_WORDS[@]}" != "2" ]; then
        return
    fi
    COMPREPLY=($(compgen -W "$(oc get ns -o jsonpath="{range .items[*]}{.metadata.name }{' '}")" -- "${COMP_WORDS[1]}"))
#    for word in $(oc get ns -o jsonpath="{range .items[*]}{.metadata.name }{' '}"); do
#        COMPREPLY+=("${word}")
#    done
}

complete -F _ns_completions ns
