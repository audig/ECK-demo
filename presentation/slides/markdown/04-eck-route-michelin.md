<!-- .slide: class="two-column" -->


Est-ce que ECK peut nous faire passer de ça<br><br>
![h-800 center](./assets/images/homer-cooking.gif)
<!-- .element: class="fragment" -->

##--##

À ça<br><br>
![h-800 center](./assets/images/cooking-pro.gif)
<!-- .element: class="fragment" -->

##==##

<!-- .slide: class="quote-slide" -->

## La promesse d'ECK :

<blockquote>
<cite>
Elastic Cloud sur Kubernetes facilite l'exécution d'Elasticsearch et de Kibana sur Kubernetes : configuration, mises à niveau, snapshots, scaling, haute disponibilité, sécurité…
</cite>
</blockquote>

[Source](https://www.elastic.co/fr/elastic-cloud-kubernetes)
<!-- .element: class="credits" -->

##==##

## Les principes d'ECK

* Déploiement dans Kubernetes, avec le pattern Kubernetes Operator
* CRDs: Elasticsearch, Kibana, Logstash, Beats ...
* Smart Rolling Update
* Sécurisé: authentification, chiffrement TLS, droits RBAC
* Service Discovery
* Connecte l'ensemble des composants sans configuration spécifique
* Gestion fine des roles des nœuds et des versions à déployer
 <!-- .element: class="list-fragment" -->

Notes:
- Alpha en 2019, en 2020 1.0.0, depuis 2021 release tous les 3 mois
- Basé sur le pattern Kubernetes Operator, opérateur officiel Elastic
- Propose des CRDs pour décrire l'état souhaité de la stack elastic
- Gère les ressources elastic: Elasticsearch, Kibana, Logstash, Beats ...
- Applique des rolling update intelligent sur la stack, sans downtine
- Sécurisé par défaut avec de l'authentification, Chiffrement TLS, Droit RBAC
- Générer les certificats internes à elasticsearch
- S'assurer que l'ensemble de la stack est au même niveau de version
- Décrire la configuration de chaque type de nœud
- Distribuer les certificats pour les clients (kibana, filebeat, logstash)
- Gérer les roles et privilèges des différents clients
- Gérer les mapping, ILM etc...
##--##

## Le pattern Operator

Tout est API dans Kubernetes, cette api peut être étendu, par des CRDs

<blockquote>
<cite>
Les opérateurs sont des extensions logicielles de Kubernetes qui utilisent des ressources personnalisées pour gérer les applications et leurs composants. Les opérateurs suivent les principes de Kubernetes, notamment la boucle de contrôle.
</cite>
</blockquote>

##--##

Un operator est défini par :

* Des <b>Custom Resources Definition</b> (CRDs) définissant nos objets kubernetes spécialisés
* Des <b>Custom Resources</b> (CR) qui sont des instances des CRDs
* Un <b>controller</b> qui analyse les CRs déployées sur le cluster et qui s'assure que l'état déclaré soit bien l'état en cours
* Le controller peut avoir plus ou moins d'intelligence pour gérer :
    * Les upgrades
    * La mise en réseau dans un cluster
    * Le nettoyage des ressources
    * Les opérations de remédiation à une panne
    * etc...

##--##

![h-1000 center](./assets/images/k8s-operator.webp)
[Source](https://www.cncf.io/blog/2022/06/15/kubernetes-operators-what-are-they-some-examples/)
<!-- .element: class="credits" -->

