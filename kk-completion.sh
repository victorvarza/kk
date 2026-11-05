#!/usr/bin/env bash

KUBECONFIG_DIR=${KUBECONFIG_DIR:-"${HOME}/.kube/conf.d/"}

_getconf()
{
        find ${KUBECONFIG_DIR} -maxdepth 1 -exec basename {} \;
}

_kk() {
       local cur=${COMP_WORDS[COMP_CWORD]}
       COMPREPLY=( $(compgen -W "$(_getconf)" -- $cur) )
}
complete -F _kk kk
