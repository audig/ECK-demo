.PHONY: create-cluster delete-cluster clean terraform-init terraform-plan terraform-apply deploy-filebeat deploy-sample-app deploy-sample-app-annotated

CLUSTER_NAME=eck-demo
ELASTIC_IMAGE=docker.elastic.co/elasticsearch/elasticsearch:8.4.1
KIBANA_IMAGE=docker.elastic.co/kibana/kibana:8.4.1
ELASTIC_OPERATOR_IMAGE=docker.elastic.co/eck/eck-operator:2.4.0
FILEBEAT_IMAGE=docker.elastic.co/beats/filebeat:8.4.1

default: create-cluster

create-cluster:
	kind create cluster -n ${CLUSTER_NAME}
	sudo sysctl -w vm.max_map_count=262144
	docker pull ${ELASTIC_IMAGE} && kind load docker-image -n ${CLUSTER_NAME} ${ELASTIC_IMAGE}
	docker pull ${KIBANA_IMAGE} && kind load docker-image -n ${CLUSTER_NAME} ${KIBANA_IMAGE}
	docker pull ${ELASTIC_OPERATOR_IMAGE} && kind load docker-image -n ${CLUSTER_NAME} ${ELASTIC_OPERATOR_IMAGE}
	docker pull ${FILEBEAT_IMAGE} && kind load docker-image -n ${CLUSTER_NAME} ${FILEBEAT_IMAGE}
	helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
	helm repo update
	helm upgrade --install --set args={--kubelet-insecure-tls} metrics-server metrics-server/metrics-server --namespace kube-system

deploy-operator:
	helm repo add elastic https://helm.elastic.co
	helm upgrade -i eck-operator elastic/eck-operator -n elastic-system --create-namespace

deploy-stack-elk:
	kubectl apply -k manifests/elk-stack


deploy-eck: deploy-operator deploy-stack-elk

run-terraform: terraform-init terraform-plan terraform-apply

deploy-filebeat:
	kubectl apply -k manifests/filebeat

deploy-sample-app:
	kubectl apply -k manifests/nginx-sample-app



clean:
	kind delete cluster -n ${CLUSTER_NAME}
	sudo sysctl -w vm.max_map_count=65530





