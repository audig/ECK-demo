.PHONY: create-cluster delete-cluster clean terraform-init terraform-plan terraform-apply

CLUSTER_NAME=eck-demo

all: create-cluster deploy-eck

default: create-cluster

create-cluster:
	kind create cluster -n ${CLUSTER_NAME}
	sudo sysctl -w vm.max_map_count=262144

deploy-operator:
	helm repo add elastic https://helm.elastic.co
	helm upgrade -i eck-operator elastic/eck-operator

deploy-stack-elk:
	kubectl apply -k manifests/elk-stack


deploy-eck: deploy-operator deploy-stack-elk

run-terraform: terraform-init terraform-plan terraform-apply

deploy-filebeat:
	kubectl apply -k manifests/filebeat

deploy-sample-app:
	kubectl apply -k manifests/nginx-sample-app

deploy-sample-app-annotated:
	kubectl apply -k manifests/nginx-sample-app-annotated


clean:
	kind delete cluster -n ${CLUSTER_NAME}
	sudo sysctl -w vm.max_map_count=65530





