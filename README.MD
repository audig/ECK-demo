# Steps de la demo

## Deploy Stack

Création du cluster avec kind & déploiement de l'operator eck & déploiement des ressources
```bash
make create-cluster
```

Déploiement operateur
```bash
make deploy-operator
```

Déploiement stack elk
```bash
make deploy-stack-elk
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
kubectl port-forward deploy/nginx -n default 30080:80 &
```

Faire quelques requete sur localhost:30080

## No log returned by demo app in kibana

Check dans kibana que le filtre app.name=nginx ne retourne rien

## Deploy demo app annotated

```bash
make deploy-sample-app-annotated
kubectl get pods -n default
kubectl port-forward deploy/nginx -n default 30080:80 &
```
