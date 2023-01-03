.PHONY: create-cluster delete-cluster clean config deploy test deploy-operator deploy-stack-elk

CLUSTER_NAME=eck-demo
ELASTIC_NS=elastic-system
ELASTIC_SECRET_NAME=elasticsearch-logs-es-elastic-user
ELASTIC_IMAGE=docker.elastic.co/elasticsearch/elasticsearch:8.4.1
KIBANA_IMAGE=docker.elastic.co/kibana/kibana:8.4.1
ELASTIC_OPERATOR_IMAGE=docker.elastic.co/eck/eck-operator:2.4.0
FILEBEAT_IMAGE=docker.elastic.co/beats/filebeat:8.4.1
TERRAFORM_LOCATION=demo/05-terraform-configure-index


default: create-cluster

create-cluster:
	kind create cluster -n ${CLUSTER_NAME} --config kind-config.yaml
	sudo sysctl -w vm.max_map_count=262144
	docker pull ${ELASTIC_IMAGE} && kind load docker-image -n ${CLUSTER_NAME} ${ELASTIC_IMAGE}
	docker pull ${KIBANA_IMAGE} && kind load docker-image -n ${CLUSTER_NAME} ${KIBANA_IMAGE}
	docker pull ${ELASTIC_OPERATOR_IMAGE} && kind load docker-image -n ${CLUSTER_NAME} ${ELASTIC_OPERATOR_IMAGE}
	docker pull ${FILEBEAT_IMAGE} && kind load docker-image -n ${CLUSTER_NAME} ${FILEBEAT_IMAGE}
	helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
	helm repo update
	helm upgrade --install --set args={--kubelet-insecure-tls} metrics-server metrics-server/metrics-server --namespace kube-system

deploy-operator:
	kubectl config set-context kind-$(CLUSTER_NAME) --namespace=$(ELASTIC_NS)
	helm repo add elastic https://helm.elastic.co
	helm upgrade -i eck-operator elastic/eck-operator -n $(ELASTIC_NS) --create-namespace

deploy-stack-elk:
	kubectl apply -k demo
	demo/02-deploy-elastic-kibana/wait_elastic_ready.sh elasticsearch-logs

deploy: deploy-operator deploy-stack-elk


index-config:
	kubectl config set-context kind-$(CLUSTER_NAME) --namespace=$(ELASTIC_NS)
	kubectl port-forward svc/elasticsearch-logs-es-http 9200:9200  > /dev/null 2>&1 &
	$(eval ELASTICSEARCH_PASSWORD=$(shell kubectl get secret $(ELASTIC_SECRET_NAME) -o jsonpath='{.data.elastic}' | base64 --decode))
	cd $(TERRAFORM_LOCATION) && \
 		terraform init && \
 		ELASTICSEARCH_PASSWORD=${ELASTICSEARCH_PASSWORD} \
		terraform apply --auto-approve

test:
	ab -n 500 -c 20 http://localhost:30000/

all:  create-cluster deploy index-config test

clean:
	kind delete cluster -n ${CLUSTER_NAME}
	rm demo/05-terraform-configure-index/*.tfstate
	sudo sysctl -w vm.max_map_count=65530





