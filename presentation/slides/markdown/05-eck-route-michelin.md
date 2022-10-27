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

* Alpha en 2019, en 2020 1.0.0, depuis 2021 release tous les 3 mois
* Basé sur le pattern Kubernetes Operator, Opérateur officiel Elastic
* Propose des CRDs pour décrire l'état souhaité de la stack elastic
* Gère les ressources elastic:
  * Elasticsearch
  * Kibana
  * Logstash
  * Beats
  * ApmServer
  * etc...
* Applique des rolling update intelligent sur la stack, sans downtine
* Sécurisé par défaut avec de l'authentification, Chiffrement TLS, Droit RBAC
* Connecte l'ensemble des composants sans configuration spécifique
* Gestion fine des roles des noeuds et des versions à déployer
* Supporte la plupart des providers cloud kubernetes
 <!-- .element: class="list-fragment" -->

##--##

## Le pattern Operator

Tout est API dans Kubernetes, cette api peut être étendu, par des CRDs

<blockquote>
<cite>
Les opérateurs sont des extensions logicielles de Kubernetes qui utilisent des ressources personnalisées pour gérer les applications et leurs composants. Les opérateurs suivent les principes de Kubernetes, notamment la boucle de contrôle.
</cite>
</blockquote>


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

## Est-ce que ECK pourrait être notre gars sûr

* NON ![h-200](./assets/images/homer.png)
 <!-- .element: class="list-fragment" -->

<br><br><br>

* OUI ![h-200](./assets/images/Etchebest.jpg) ![h-200](./assets/images/Gordon.webp)
 <!-- .element: class="list-fragment" -->


