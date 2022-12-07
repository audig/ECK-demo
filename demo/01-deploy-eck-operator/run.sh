#!/bin/bash

set -eo pipefail

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${__dir}/../common-demo.sh"
cd "${__dir}"

# hide the evidence
ctx=kind-eck-demo
elastic_ns=elastic-system
kubectl config use-context $ctx
kubectl config set-context $ctx --namespace=$elastic_ns
pe "kubectl get nodes"

pe "clear"
echo "⛵ Install ECK operator ⛵"
p "helm repo add elastic https://helm.elastic.co"
pe "helm upgrade -i eck-operator elastic/eck-operator -n elastic-system --create-namespace"

pe "kubectl get pods --watch"

