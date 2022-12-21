#!/bin/bash

set -eo pipefail

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${__dir}/../common-demo.sh"
cd "${__dir}"


echo "⚙️ Configure index with terraform ⚙️"
deploy_dir="."

pe "tree $deploy_dir"
echo
pe "kubectl port-forward svc/elasticsearch-logs-es-http 9200:9200  > /dev/null 2>&1 &"
echo
pe "export ELASTICSEARCH_PASSWORD=\$(kubectl get secret elasticsearch-logs-es-elastic-user -n elastic-system -o jsonpath='{.data.elastic}' | base64 --decode)"
echo
terraform init
pe "terraform plan"
pe "terraform apply"