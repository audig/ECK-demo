<!-- .slide: class="transition left sfeir-bg-1" -->

# Anatomie du déploiement d'ECK

##==##

![h-1000 center](./assets/images/ECK-schema.svg)

##==##

## Ressource Elasticsearch

<!-- .slide: class="with-code-dark" -->

```yaml [1-2|6|7-10|12,15,18,21|13,19]
apiVersion: elasticsearch.k8s.elastic.co/v1
kind: Elasticsearch
metadata:
  name: elasticsearch-logs
spec:
  version: 8.4.1
  monitoring:
    metrics:
      elasticsearchRefs:
        - name: elasticsearch-logs
  nodeSets:
    - name: master-nodes
      count: 1
      config:
        node.roles: [ "master" ]
      podTemplate:
        ...
    - name: data-nodes
      count: 2
      config:
        node.roles: [ "data","ingest" ]
```

##==##

<!-- .slide: class="with-code-dark" -->

## Ressource Kibana

```yaml [1-2|6|8-9|10-18]
apiVersion: kibana.k8s.elastic.co/v1
kind: Kibana
metadata:
  name: kibana-logs
spec:
  version: 8.4.1
  count: 1
  elasticsearchRef:
    name: elasticsearch-logs
  podTemplate:
    spec:
      containers:
        - name: kibana
          resources:
            limits:
              memory: 1Gi
              cpu: 1

```

