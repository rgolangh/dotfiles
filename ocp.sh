#!/bin/bash

function latest_release() {
        curl -s https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp-dev-preview/latest-4.6/release.txt | awk '/^Pull From:/ {print $3}'
}

#export OPENSHIFT_INSTALL_RELEASE_IMAGE_OVERRIDE=docker.io/rgolangh/ocp-release-dev:latest

export OPENSHIFT_INSTALL_RELEASE_IMAGE_OVERRIDE=$(latest_release)
export OPENSHIFT_INSTALL_OS_IMAGE_OVERRIDE=catapult-rhcos
export KUBECONFIG=$HOME/deploy/ocp/catapult/auth/kubeconfig
source <(oc completion bash)

alias ocmao='oc -n openshift-machine-api'
alias occsi='oc -n ovirt-csi-driver'

