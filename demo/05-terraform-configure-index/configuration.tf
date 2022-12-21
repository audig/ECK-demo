terraform {
  required_version = "~> 1.3"
  required_providers {
    elasticstack = {
      source  = "elastic/elasticstack"
      version = "~> 0.3.3"
    }
  }
}
provider "elasticstack" {
  elasticsearch {
    endpoints = ["https://localhost:9200"]
    insecure = true
    username = "elastic"
  }
}



