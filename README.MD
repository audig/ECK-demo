# Deploy Stack

Création du cluster avec kind & déploiement de l'operator eck & déploiement des ressources
```bash
make all
```

# Access Elasticsearch

Port forward different services

```bash
kubectl port-forward svc/elasticsearch-logs-es-http -n elastic-system  9200:9200 & 
kubectl port-forward svc/kibana-logs-kb-http -n elastic-system  5601:5601 & 
kubectl port-forward deploy/nginx -n default 30080:30080 &
```

Open browser to localhost:5601 to access kibana, and auth withou account elastic and password give by :
```bash
kubectl get secret elasticsearch-logs-es-elastic-user -n elastic-system -o jsonpath='{.data.elastic}' | base64 --decode
```



Port forward can be stoped

```bash
pkill -f "kubectl port-forward"
```

# Get elastic secret
```bash
kubectl get secret elasticsearch-logs-es-elastic-user -n elastic-system -o jsonpath='{.data.elastic}' | base64 --decode
```

Upgrade elastic credentials in terraform/configuration.tf


# Terraform create index

Run terraform plan
```bash
cd terraform
terraform init
terraform plan
```

# Deploy filebeat

```bash
make deploy-filebeat

```

# Deploy sample app

```bash
make deploy-sample-app
```

No log returned by kibana

# Annotate sample-app to collect logs

```bash
make deploy-sample-app-annotated
```
