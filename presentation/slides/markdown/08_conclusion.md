## Conclusion

* Est-ce que le déploiement d'un stack a été simple ?
    * Topologie cluster Elastic As Code
    * Helpers certificats, access management, connection kibana
    * Autodiscover de la configuration de logging


 <!-- .element: class="list-fragment" -->

##==##

## Outils utilisés pour la démo
* Source code dispo sous github: https://github.com/audig/ECK-demo
* Slides: RevealJs theme [Sfeir school theme](https://github.com/sfeir-open-source/sfeir-school-theme)
* Schéma: [Excalidraw](https://excalidraw.com/)
* Demo shell: [Demo magic](https://github.com/paxtonhare/demo-magic)
* Cluster Kubernetes: [Kind](https://kind.sigs.k8s.io/)
* Déploiement Workload: [Helm](https://helm.sh/) & [Kustomize](https://kustomize.io/)
* Configuration index elastic: [Terraform](https://www.terraform.io/) & [Terraform provider elasticstack](https://github.com/elastic/terraform-provider-elasticstack) 
* Generation de load http: [Apache Bench](https://httpd.apache.org/docs/2.4/fr/programs/ab.html)
* Automatisation déploiement démo: [Make](https://www.gnu.org/software/make/)
* Validation de la syntaxe scripts et yaml: [Shellcheck](https://www.shellcheck.net/) & [Yamllint](https://yamllint.readthedocs.io/en/stable/)
* Autocomplétion & validation resources Kubernetes: [IntelliJ Kubernetes Plugins](https://plugins.jetbrains.com/plugin/10485-kubernetes) _(Use API schema from the active cluster)_


