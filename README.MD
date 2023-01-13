# How to run the demo

# Requirements

This project have been tested on an ubuntu distro.

You need at least all this binaries:

* [Taskfile](https://taskfile.dev/installation/) to run all the steps
* Kind to create a local kubernetes cluster
* Kubectl to apply resources to kind
* Terraform to create index mappings in elasticsearch
* Helm to deploy eck operator
* Apache bench (ab) to generate load on nginx to get some logs in elasticsearch

# Commands to run the deployment

At the root of the project run :

```bash
task all
```

You can clean your environement with

```bash
task clean
```

# Helpful commands

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
