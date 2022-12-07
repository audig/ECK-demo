#!/bin/bash

set -eo pipefail

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${__dir}/../common-demo.sh"
cd "${__dir}"


echo "⏫⭐⭐ Scale UP data nodes ⭐⭐⏫"
deploy_dir="."
echo
pe "kubectl patch elasticsearch elasticsearch-logs --type=json -p='[{"op": "replace", "path": "/spec/nodeSets/1/count", "value": 2 }]'"
echo
pe "watch kubectl get pods"

echo 
echo "🔍 Let's inspect our cluster status 🔍"
pe "kubectl port-forward svc/elasticsearch-logs-es-http 9200:9200  > /dev/null 2>&1 &"
echo
pe "ELASTIC_PASSWORD=\$(kubectl get secret elasticsearch-logs-es-elastic-user -n elastic-system -o jsonpath='{.data.elastic}' | base64 --decode)"
echo
pe "curl -s -k -u elastic:\$ELASTIC_PASSWORD https://localhost:9200/_cluster/health | jq"

wait 
clear
