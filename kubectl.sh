#!/bin/bash

export KUBECONFIG="/var/home/rgolan/.kube/config"
KUBECONFIG+=":/var/home/rgolan/clusters/hub-helios04/ocp-dev-cluster/my-cluster/auth/kubeconfig"
KUBECONFIG+=":/var/home/rgolan/clusters/kind/kubeconfig"

source <(kubectl completion bash)
alias k='kubectl'
complete -F __start_kubectl k

function ns() {
    kubectl config set-context --current --namespace "${1:-default}"
}

_ns_completions() {
    COMPREPLY=($(compgen -W "$(oc get ns -o jsonpath="{range .items[*]}{.metadata.name }{' '}")" -- "${COMP_WORDS[1]}"))
#    for word in $(oc get ns -o jsonpath="{range .items[*]}{.metadata.name }{' '}"); do
#        COMPREPLY+=("${word}")
#    done
}

complete -F _ns_completions ns
