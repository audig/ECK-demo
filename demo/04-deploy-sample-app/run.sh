#!/bin/bash

set -eo pipefail

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${__dir}/../common-demo.sh"
cd "${__dir}"


echo "⚙️ Deploy demo app nginx ⚙️"
deploy_dir="."
echo
pe "tree $deploy_dir"
echo
pe "kubectl apply -k $deploy_dir"
echo
pe "kubectl get deploy,pods"
pe "clear"
echo "🤿 Let's dive into the code 🤿"
PROMPT_TIMEOUT=0
wait
switchEditorIfNeeded

wait

echo "Generate some logs to demo apps"
pe "ab -n 500 -c 20 http://localhost:30000/"
pe "clear"
echo "🌐 Go to Kibana UI 🌐"
echo
pe "kubectl port-forward svc/kibana-logs-kb-http 5601:5601  > /dev/null 2>&1 &"
echo "Let's go for:"
echo "* Create Data view on filebeat*"
echo "* Filter logs in discover to app.name exist"
echo "* Show in table column, app.name, index, message"
pe "open https://localhost:5601/ > /dev/null 2>&1"
wait

clear
