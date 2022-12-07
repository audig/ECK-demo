# Steps de la demo

## Deploy Stack

Création du cluster avec kind & déploiement de l'operator eck & déploiement des ressources
```bash
make create-cluster
```

Déploiement operateur
```bash
helm repo add elastic https://helm.elastic.co
helm upgrade -i 01-deploy-eck-operator elastic/01-deploy-eck-operator -n elastic-system --create-namespace
```

Déploiement stack elk
```bash
tree manifests/elk-stack
kubectl apply -k manifests/elk-stack
```

## Wait pod ready

```bash
kubectl get pods -n elastic-system --watch
```

## Port Forward elasticsearch & kibana
```bash
kubectl port-forward svc/elasticsearch-logs-es-http -n elastic-system  9200:9200 & 
kubectl port-forward svc/kibana-logs-kb-http -n elastic-system  5601:5601 & 
```

## Récupération secret elastic

Open browser to localhost:5601 to access kibana, and auth withou account elastic and password give by :
```bash
kubectl get secret elasticsearch-logs-es-elastic-user -n elastic-system -o jsonpath='{.data.elastic}' | base64 --decode
```
# Terraform create index

Upgrade elastic credentials in terraform/configuration.tf

Run terraform plan
```bash
cd terraform
terraform init
terraform plan
terraform apply
```



## Déploiement filebeat

```bash
make deploy-filebeat
kubectl get pods -n elastic-system --watch
```

Création d'un dataview sur filebeat*

## Deploy demo app

```bash
make deploy-sample-app
kubectl get pods -n default --watch
```

## Port forward demo app

```bash
kubectl port-forward deploy/nginx-no-log -n default 30080:80 &
kubectl port-forward deploy/nginx-default-log -n default 30081:80 &
kubectl port-forward deploy/nginx-access-log -n default 30082:80 &
```

Faire quelques requete sur les pods nginx
```bash
for i in {1..10}
do 
  curl localhost:30080
  curl localhost:30081
  curl localhost:30082
done
```

## Consultation des logs dans kibana


