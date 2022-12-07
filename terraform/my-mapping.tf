resource "elasticstack_elasticsearch_component_template" "ct_filebeat-mapping-logs" {
  name = "filebeat-mapping-logs"
  template {
    mappings = file("${path.root}/files/company-filebeat-log-mapping.json")
  }
}















