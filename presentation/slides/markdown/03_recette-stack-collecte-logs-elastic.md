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
 
## Qualité de ce plat
#TODO
### En fonction du nombre d'étoiles que vous visez, vous devez vous adapter
<br><br>
⭐ Un elasticsearch, en plain http, avec l'ensemble des roles elasticsearch

<br>

⭐⭐ Un cluster elasticsearch (minimum: 3), avec l'ensemble des rôles elasticsearch

<br>

⭐⭐⭐ Des sets de nodes pour chacun des roles elasticsearch (data, master, ingest, coordinator), avec des replicas pour chaque rôle, configuré en MTLS



