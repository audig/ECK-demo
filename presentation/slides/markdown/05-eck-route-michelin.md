<!-- .slide: class="transition left sfeir-bg-1" -->

# ECK: en route vers l'étoile michelin

##==##

## Est-ce que ECK peut nous faire passer de ça: 

![h-800 center](./assets/images/homer-cooking.gif)

##==##

## À ça: 

![h-800 center](./assets/images/cooking-pro.gif)

##==##

<!-- .slide: class="quote-slide" -->

## La promesse d'ECK:

<blockquote>
<cite>
Elastic Cloud sur Kubernetes facilite l'exécution d'Elasticsearch et de Kibana sur Kubernetes : configuration, mises à niveau, snapshots, scaling, haute disponibilité, sécurité…
</cite>
</blockquote>

##==##

## Les principes d'ECK

* Basé sur le pattern Kubernetes Operator
* Propose des CRDs pour décrire l'état souhaité de la stack elastic
* Gère les ressources elastic:
  * Elasticsearch
  * Kibana
  * Logstash
  * Beats
  * ApmServer
  * etc...
* Applique des rolling update intelligent sur la stack
* Sécurisé par défaut avec ude l'authentification, Chiffrement TLS, Droit RBAC
* Connecte l'ensemble des composants sans configuration spécifique
* Gestion fine des roles des noeuds et des versions à déployer


##--##

## Le pattern Operator

Tout est API dans Kubernetes, cette api peut être étendu, par des CRDs

Un operator est définit par:

* Des <b>Custom Resources Definition</b> (CRDs) définissant nos objets kubernetes spécialisé
* Des <b>Custom Resouces</b> (CR) qui sont des instance des CRDs
* Un <b>controller</b> qui analyse les CRs déployé sur le cluster et qui s'assure que l'état déclaré soit bien l'état en cours
* Le controller peut avoir plus ou moins d'intelligence pour gérer:
    * Les upgrades
    * La mise en réseau dans un cluster
    * Le nettoyage des ressources
    * Les opérations de remédiation à une panne
    * etc...

##--##

![h-1000 center](./assets/images/k8s-operator.webp)

##==##

# TOTO
