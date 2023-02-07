#!/bin/bash

set -eo pipefail

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${__dir}/../common-demo.sh"
cd "${__dir}"



echo "🥘 Deploy Elasticsearch 🥘"
deploy_dir="./elasticsearch"
pe "head -n 7 $deploy_dir/elasticsearch.yaml"
echo
pe "kubectl apply -k $deploy_dir"
echo
pe "kubectl get elasticsearch"
echo
pe "kubectl get statefulsets,pods"
pe "clear"


echo "🌶️ Deploy Kibana 🌶️"
deploy_dir="./kibana"
pe "head -n 10 $deploy_dir/kibana.yaml"
echo
pe "kubectl apply -f $deploy_dir/kibana.yaml"
echo
pe "kubectl get kibana"
echo
pe "kubectl get deploy,pods"
pe "clear"


echo "🌿 Deploy Filebeat 🌿"
deploy_dir="./filebeat"
pe "head -n 10 $deploy_dir/filebeat.yaml"
echo
pe "kubectl apply -k $deploy_dir"
echo
pe "kubectl get beat"
echo
pe "kubectl get ds,pods"
pe "clear"


echo "🤿 Let's dive into the code 🤿"
PROMPT_TIMEOUT=0
wait
switchEditorIfNeeded

wait
echo
pe "kubectl get elasticsearch,kibana,beat"
pe "clear"

echo "🔍 Let's inspect our cluster status 🔍"
pe "kubectl port-forward svc/elasticsearch-logs-es-http 9200:9200  > /dev/null 2>&1 &"
echo
pe "ELASTICSEARCH_PASSWORD=\$(kubectl get secret elasticsearch-logs-es-elastic-user -n elastic-system -o jsonpath='{.data.elastic}' | base64 --decode)"
echo
pe "curl -s -k -u elastic:\$ELASTICSEARCH_PASSWORD https://localhost:9200/_cluster/health | jq"

pe "clear"
echo "🌐 Go to Kibana UI 🌐"
pe "kubectl port-forward svc/kibana-logs-kb-http 5601:5601  > /dev/null 2>&1 &"
echo ""
echo "Authenticate with creds ELASTIC : username: elastic , password: $ELASTICSEARCH_PASSWORD"
pe "open https://localhost:5601 > /dev/null 2>&1"
wait








