## Elastic historique

- First release: 2010
- Produit de lancement: Elasticsearch
- En 2015 changement de nom de la société: Elasticsearch -> Elastic
- Elastic Stack: Elasticsearch, Kibana, Beats, Logstash
- Services payant: X-Pack, Elastic Cloud, Elastic Cloud Entreprise
- 2021: Adieu la license opensource
 <!-- .element: class="list-fragment" -->

![left](./assets/images/devil-elastic.png)
<!-- .element: class="fragment" -->
Apache 2.0 -> Server Side Public License & Elastic License
<!-- .element: class="fragment" -->

##==##

## Les ingrédients d'une bonne stack de logs


- L'ingrédient principal : de quoi stocker toutes vos logs que vous allez ingérer
  <br><center>🥘 Elasticsearch 🥘</center><br>
- Afin d'agrémenter votre ingrédient principal : un système de récupération des logs
  <br><center>🧂 Filebeat 🧂</center><br>
- Selon vos gôuts, rajouter un moteur de transformation de logs, ou du queuing
  <br><center>🌶️ Logstash 🌶️</center><br>
- Et pour pimper le tout, et en mettre plein les mirettes, de quoi observer les logs
  <br><center>🌿 Kibana 🌿</center><br>
 <!-- .element: class="list-fragment" -->
##==##
 
## Qualité de la recette

<br><br>
⭐ Un elasticsearch, en plain http, avec l'ensemble des roles elasticsearch
<!-- .element: class="fragment" -->
<br>

⭐⭐ Un cluster elasticsearch (minimum: 3), avec l'ensemble des rôles elasticsearch
<!-- .element: class="fragment" -->
<br>

⭐⭐⭐ Des sets de nodes pour chacun des roles elasticsearch (data, master, ingest, coordinator), avec des replicas pour chaque rôle, configuré en MTLS
<!-- .element: class="fragment" -->

Notes:
- Dans kubernetes, maintenir des manifest "raw", ou un kustomize long comme le bras, ou un méta chart dépendant des charts officiels elastic
- La compléxité des upgrades
- Générer les certificats internes à elasticsearch
- S'assurer que l'ensemble de la stack est au même niveau de version
- Décrire la configuration de chaque type de nœud
- Distribuer les certificats pour les clients (kibana, filebeat, logstash)
- Gérer les roles et privilèges des différents clients
- Gérer les mapping, ILM etc...

