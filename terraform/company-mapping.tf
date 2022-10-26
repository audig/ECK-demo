resource "elasticstack_elasticsearch_component_template" "ct_company-filebeat-mapping-logs" {
  name = "company-filebeat-mapping-logs"
  template {
    mappings = file("${path.root}/files/company-filebeat-log-mapping.json")
  }
}















