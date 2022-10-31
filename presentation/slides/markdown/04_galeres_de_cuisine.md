<!-- .slide: class="transition left sfeir-bg-1" -->

# Les galères en cuisine

##==##

![h-1000 center](./assets/images/homer-cooking.gif)

##==##

## Les galères rencontrées :

- Dans kubernetes, maintenir des manifest "raw", ou un kustomize long comme le bras, ou un méta chart dépendant des charts officiels elastic
- La compléxité des upgrades
- Générer les certificats internes à elasticsearch
- S'assurer que l'ensemble de la stack est au même niveau de version
- Décrire la configuration de chaque type de nœud
- Distribuer les certificats pour les clients (kibana, filebeat, logstash)
- Gérer les roles et privilèges des différents clients
- Gérer les mapping, ILM etc...
 <!-- .element: class="list-fragment" -->