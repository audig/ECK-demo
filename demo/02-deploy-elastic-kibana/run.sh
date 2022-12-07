#!/bin/bash

set -eo pipefail

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${__dir}/../common-demo.sh"
cd "${__dir}"



echo "🥘 Deploy Elasticsearch 🥘"
deploy_dir="./elasticsearch"
pe "tree $deploy_dir"
echo
pe "kubectl apply -k $deploy_dir"
echo
pe "watch kubectl get pods"
echo
echo "🤿 Let's dive into the code 🤿"
PROMPT_TIMEOUT=0
wait
#switchEditorIfNeeded
runIde

wait
echo

echo "🔍 Let's inspect our cluster status 🔍"
pe "kubectl port-forward svc/elasticsearch-logs-es-http 9200:9200  > /dev/null 2>&1 &"
echo
pe "ELASTIC_PASSWORD=\$(kubectl get secret elasticsearch-logs-es-elastic-user -n elastic-system -o jsonpath='{.data.elastic}' | base64 --decode)"
echo
pe "curl -s -k -u elastic:\$ELASTIC_PASSWORD https://localhost:9200/_cluster/health | jq"


wait

clear


echo "🌶️ Deploy Kibana 🌶️"
deploy_dir="./kibana"
pe "tree $deploy_dir"
pe "kubectl apply -f $deploy_dir/kibana.yaml"
pe "watch kubectl get pods"
echo
echo "🤿 Let's dive into the code 🤿"
PROMPT_TIMEOUT=0
wait
switchEditorIfNeeded
runIde







