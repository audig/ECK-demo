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
make deploy
```

# Commandes utiles

## Port Forward elasticsearch & kibana
```bash
kubectl port-forward svc/elasticsearch-logs-es-http -n elastic-system  9200:9200 & 
kubectl port-forward svc/kibana-logs-kb-http -n elastic-system  5601:5601 & 
```

## Récupération secret elastic

Open browser to localhost:5601 to access kibana, and auth with account elastic and password give by :
```bash
kubectl get secret elasticsearch-logs-es-elastic-user -n elastic-system -o jsonpath='{.data.elastic}' | base64 --decode
```
