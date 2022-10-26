<!-- .slide: class="transition left sfeir-bg-1" -->

# Les ingrédients d'une bonne stack de logs

##==##

## Les ingrédients d'une bonne stack de logs


- L'ingrédient principal: de quoi stocker toutes vos logs que vous allez ingérer
  <br><center>🥘 Elasticsearch 🥘</center><br>
- Afin d'agrémenter votre ingrédient principale: un système de récupération des logs:
  <br><center>🧂 Filebeat 🧂</center><br>
- Selon vos gôuts, rajouter un moteur de tranformation de logs
  <br><center>🌶️ Logstash 🌶️</center><br>
- Et pour pimper le tout, et en mettre plein les mirettes, de quoi observer les logs
  <br><center>🍒 Kibana 🍒</center><br>
 <!-- .element: class="list-fragment" -->
##==##
 
## Qualité de ce plat

### En fonction du nombre d'étoile que vous visez, vous devez vous adapter

⭐

Un elasticsearch, en plain http, avec l'ensemble des roles elasticsearch

⭐⭐

Plusieurs elasticsearch (3), avec l'ensemble des rôles elasticsearch

⭐⭐⭐

Des sets de nodes pour chacun des roles elasticsearch (data, master, ingest), configuré en MTLS



