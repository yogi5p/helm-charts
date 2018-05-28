# SNMP baremetal metrics for Prometheus

These are for baremetal servers created via openstack ironic.
The focus is on error/defect metrics.
We make use of the [SNMP exporter](https://github.com/prometheus/snmp_exporter/).
It only works with hardware for which the `snmp.yml` has been adapted. You
need to add a module with the correct data for your hardware.
In this helm chart it is generated from the `_snmp.yml.tpl` and then loaded via
a configmap.
