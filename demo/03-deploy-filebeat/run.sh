#!/bin/bash

set -eo pipefail

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${__dir}/../common-demo.sh"
cd "${__dir}"


echo "🌿 Deploy Filebeat 🌿"
deploy_dir="."
echo
pe "tree $deploy_dir"
echo
pe "kubectl apply -k $deploy_dir"
echo
pe "watch kubectl get pods"
echo "🤿 Let's dive into the code 🤿"
PROMPT_TIMEOUT=0
wait
switchEditorIfNeeded
runIde

clear
