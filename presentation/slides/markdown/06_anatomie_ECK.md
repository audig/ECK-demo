<!-- .slide: class="transition left sfeir-bg-1" -->

# Anatomie du déploiement d'ECK

##==##

## Ressource Elasticsearch

<!-- .slide: class="with-code-white" -->

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
<!-- .element: class="h-600"-->

##==##

<!-- .slide: class="with-code-white" -->

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
<!-- .element: class="h-600"-->

##==##

![h-1000 center](./assets/images/schema-elastic/1.png)

##==##

![h-1000 center](./assets/images/schema-elastic/2.png)

##==##

![h-1000 center](./assets/images/schema-elastic/3.png)

##==##

![h-1000 center](./assets/images/schema-elastic/4.png)

##==##

![h-1000 center](./assets/images/schema-elastic/5.png)

##==##

![h-1000 center](./assets/images/schema-elastic/6.png)

##==##

![h-1000 center](./assets/images/schema-elastic/7.png)

##==##

![h-1000 center](./assets/images/schema-elastic/8.png)
