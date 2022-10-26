resource "elasticstack_elasticsearch_index_template" "it_company-filebeat-access-log-app-production" {
  name           = "company-filebeat-access-log-app-production"
  index_patterns = ["company-filebeat-access-log-app-production*"]
  data_stream {}
  priority       = 500
  composed_of    = [
    elasticstack_elasticsearch_component_template.ct_company-filebeat-mapping-logs.name,
    elasticstack_elasticsearch_component_template.ct_ilm-company-filebeat-access-log-app-production.name
  ]
}

resource "elasticstack_elasticsearch_index_lifecycle" "ilm-company-filebeat-access-log-app-production" {
  name = "company-filebeat-access-log-app-production"
  #The index is actively being updated and queried.
  hot {
    min_age = "0ms"
    rollover {
      max_age                = "1h"
      max_primary_shard_size = "20gb"
    }
    readonly {}
  }
  #The index is no longer being updated but is still being queried.
  warm {
    min_age = "3h"
    readonly {}
  }
  #The index is no longer being updated and is queried infrequently. The information still needs to be searchable, but it’s okay if those queries are slower.
  cold {
    min_age = "6h"
    readonly {}
  }

  #The index is no longer needed and can safely be removed.
  delete {
    min_age = "1d"
    delete {}
  }
}

resource "elasticstack_elasticsearch_component_template" "ct_ilm-company-filebeat-access-log-app-production" {
  name = "ilm-company-filebeat-access-log-app-production"
  template {
    settings = jsonencode({
      "index.lifecycle.name" = elasticstack_elasticsearch_index_lifecycle.ilm-company-filebeat-access-log-app-production.name
    })
  }
}
