# SNMP baremetal metrics for Prometheus

These are for baremetal servers created via openstack ironic.
The focus is on error/defect metrics.
We make use of the [SNMP exporter](https://github.com/prometheus/snmp_exporter/).
It only works with hardware for which the `_snmp.yml.tpl` has been adapted. You
need to add the correct data for your hardware. 
