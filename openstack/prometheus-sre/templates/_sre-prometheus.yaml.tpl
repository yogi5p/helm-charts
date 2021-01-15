#
- job_name: 'prometheus-regions-federation'
  scheme: https
  scrape_interval: 30s
  scrape_timeout: 25s

  honor_labels: true
  metrics_path: '/federate'

  params:
    'match[]':
      - '{__name__="global:api_errors_per_request_sli:ratio_rate1h"}'
      - '{__name__="global:api_errors_per_request_sli:ratio_rate1d"}'
      - '{__name__=~"^global:api_availability.+"}'

  relabel_configs:
    - action: replace
      source_labels: [__address__]
      target_label: region
      regex: prometheus-sre.(.+).cloud.sap
      replacement: $1

  metric_relabel_configs:
    - action: replace
      source_labels: [__name__]
      target_label: __name__
      regex: global:(.+)
      replacement: $1

  {{ if .Values.authentication.enabled }}
  tls_config:
    cert_file: /etc/prometheus/secrets/prometheus-sre-sso-cert/sso.crt
    key_file: /etc/prometheus/secrets/prometheus-sre-sso-cert/sso.key
  {{ end }}

  static_configs:
    - targets:
{{- range $region := .Values.regionList }}
      - "prometheus-openstack.{{ $region }}.cloud.sap"
{{- end }}
