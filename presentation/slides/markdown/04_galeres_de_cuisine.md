<!-- .slide: class="transition left sfeir-bg-1" -->

# Les galères en cuisines

##==##

![h-1000 center](./assets/images/homer-cooking.gif)

##==##

## Les galères rencontrées :

- Dans kubernetes, maintenir des manifest "raw", ou un kustomize long comme le bras, ou un méta chart dépendant des charts officiels elastic
- La compléxité des upgrades
- Générer les certificats interne à elasticsearch
- S'assurer que l'ensemble de la stack est au même niveau de versions
- Décrire la configuration de chaque type de noeud
- Distribuer les certificats pour les clients (kibana, filebeat, logtash)
- Gérer les roles et privilèges des différents clients
- Gérer les mapping, ILM etc...
 <!-- .element: class="list-fragment" -->