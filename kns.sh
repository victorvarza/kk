# /usr/bin/env bash

if [[ $# -le 1 ]]; then
    echo "usage: $0 <namespace>"
    exit 1
fi

kubectl config set-context $(kubectl config current-context) --namespace=$1