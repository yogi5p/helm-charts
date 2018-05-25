cisco-ucs:
  walk:
  - 1.3.6.1.4.1.9.9.719.1.1.1.1.16
  - 1.3.6.1.4.1.9.9.719.1.1.1.1.2
  metrics:
  - name: cucsFaultOccur
    oid: 1.3.6.1.4.1.9.9.719.1.1.1.1.16
    type: counter
    help: Cisco UCS fault:Inst:occur managed object property - 1.3.6.1.4.1.9.9.719.1.1.1.1.16
    indexes:
    - labelname: cucsFaultDn
      type: gauge
    - labelname: cucsFaultTags
      type: OctetString
    lookups:
    - labels:
      - cucsFaultDn
      labelname: cucsFaultDn
      oid: 1.3.6.1.4.1.9.9.719.1.1.1.1.2
      type: DisplayString
    - labels:
      - cucsFaultTags
      labelname: cucsFaultTags
      oid: 1.3.6.1.4.1.9.9.719.1.1.1.1.21
      type: OctetString
  version: 2
{{- if .Values.global.snmp -}}
{{- if .Values.global.snmp.baremetal -}}
{{- if .Values.global.snmp.baremetal.auth }}
  auth:
{{ toYaml .Values.global.snmp.baremetal.auth | indent 4 -}}
{{- end -}}
{{- end -}}
{{- end }}
lenovo:
  walk:
  - 1.3.6.1.2.1.25.3.2.1.3
  - 1.3.6.1.2.1.25.3.2.1.5
  - 1.3.6.1.2.1.25.3.2.1.6
  - 1.3.6.1.4.1.2.3.51.3.1.1.2.1.10
  - 1.3.6.1.4.1.2.3.51.3.1.1.2.1.2
  - 1.3.6.1.4.1.2.3.51.3.1.1.2.1.3
  - 1.3.6.1.4.1.2.3.51.3.1.11.2.1.2
  - 1.3.6.1.4.1.2.3.51.3.1.11.2.1.6
  - 1.3.6.1.4.1.2.3.51.3.1.12.2.1.2
  - 1.3.6.1.4.1.2.3.51.3.1.12.2.1.3
  - 1.3.6.1.4.1.2.3.51.3.1.3.2.1.10
  - 1.3.6.1.4.1.2.3.51.3.1.3.2.1.2
  - 1.3.6.1.4.1.2.3.51.3.1.5.20.1.11
  - 1.3.6.1.4.1.2.3.51.3.1.5.20.1.2
  - 1.3.6.1.4.1.2.3.51.3.1.5.21.1.2
  - 1.3.6.1.4.1.2.3.51.3.1.5.21.1.8
  metrics:
  - name: hrDeviceStatus
    oid: 1.3.6.1.2.1.25.3.2.1.5
    type: gauge
    help: The current operational state of the device described by this row of the
      table - 1.3.6.1.2.1.25.3.2.1.5
    indexes:
    - labelname: hrDeviceDescr
      type: gauge
    lookups:
    - labels:
      - hrDeviceDescr
      labelname: hrDeviceDescr
      oid: 1.3.6.1.2.1.25.3.2.1.3
      type: DisplayString
  - name: hrDeviceErrors
    oid: 1.3.6.1.2.1.25.3.2.1.6
    type: counter
    help: The number of errors detected on this device - 1.3.6.1.2.1.25.3.2.1.6
    indexes:
    - labelname: hrDeviceDescr
      type: gauge
    lookups:
    - labels:
      - hrDeviceDescr
      labelname: hrDeviceDescr
      oid: 1.3.6.1.2.1.25.3.2.1.3
      type: DisplayString
  - name: tempNonCritLimitLow
    oid: 1.3.6.1.4.1.2.3.51.3.1.1.2.1.10
    type: gauge
    help: The non-critical limit for the measured temperature - 1.3.6.1.4.1.2.3.51.3.1.1.2.1.10
    indexes:
    - labelname: tempDescr
      type: gauge
    lookups:
    - labels:
      - tempDescr
      labelname: tempDescr
      oid: 1.3.6.1.4.1.2.3.51.3.1.1.2.1.2
      type: DisplayString
  - name: tempReading
    oid: 1.3.6.1.4.1.2.3.51.3.1.1.2.1.3
    type: gauge
    help: The measured temperature. - 1.3.6.1.4.1.2.3.51.3.1.1.2.1.3
    indexes:
    - labelname: tempDescr
      type: gauge
    lookups:
    - labels:
      - tempDescr
      labelname: tempDescr
      oid: 1.3.6.1.4.1.2.3.51.3.1.1.2.1.2
      type: DisplayString
  - name: powerHealthStatus
    oid: 1.3.6.1.4.1.2.3.51.3.1.11.2.1.6
    type: DisplayString
    help: A description of the power module status. - 1.3.6.1.4.1.2.3.51.3.1.11.2.1.6
    indexes:
    - labelname: powerFruName
      type: gauge
    lookups:
    - labels:
      - powerFruName
      labelname: powerFruName
      oid: 1.3.6.1.4.1.2.3.51.3.1.11.2.1.2
      type: DisplayString
  - name: diskHealthStatus
    oid: 1.3.6.1.4.1.2.3.51.3.1.12.2.1.3
    type: DisplayString
    help: A description of the disk module status. - 1.3.6.1.4.1.2.3.51.3.1.12.2.1.3
    indexes:
    - labelname: diskFruName
      type: gauge
    lookups:
    - labels:
      - diskFruName
      labelname: diskFruName
      oid: 1.3.6.1.4.1.2.3.51.3.1.12.2.1.2
      type: DisplayString
  - name: fanHealthStatus
    oid: 1.3.6.1.4.1.2.3.51.3.1.3.2.1.10
    type: DisplayString
    help: A description of the fan component status. - 1.3.6.1.4.1.2.3.51.3.1.3.2.1.10
    indexes:
    - labelname: fanDescr
      type: gauge
    lookups:
    - labels:
      - fanDescr
      labelname: fanDescr
      oid: 1.3.6.1.4.1.2.3.51.3.1.3.2.1.2
      type: DisplayString
  - name: cpuVpdHealthStatus
    oid: 1.3.6.1.4.1.2.3.51.3.1.5.20.1.11
    type: DisplayString
    help: System cpu health status - 1.3.6.1.4.1.2.3.51.3.1.5.20.1.11
    indexes:
    - labelname: cpuVpdDescription
      type: gauge
    lookups:
    - labels:
      - cpuVpdDescription
      labelname: cpuVpdDescription
      oid: 1.3.6.1.4.1.2.3.51.3.1.5.20.1.2
      type: DisplayString
  - name: memoryHealthStatus
    oid: 1.3.6.1.4.1.2.3.51.3.1.5.21.1.8
    type: DisplayString
    help: A description of the memory component status. - 1.3.6.1.4.1.2.3.51.3.1.5.21.1.8
    indexes:
    - labelname: memoryVpdDescription
      type: gauge
    lookups:
    - labels:
      - memoryVpdDescription
      labelname: memoryVpdDescription
      oid: 1.3.6.1.4.1.2.3.51.3.1.5.21.1.2
      type: DisplayString
  version: 2
{{- if .Values.global.snmp -}}
{{- if .Values.global.snmp.baremetal -}}
{{- if .Values.global.snmp.baremetal.auth }}
  auth:
{{ toYaml .Values.global.snmp.baremetal.auth | indent 4 -}}
{{- end -}}
{{- end -}}
{{- end }}
dell:
  walk:
  - 1.3.6.1.4.1.674.10892.5.4.1100.50.1.5
  - 1.3.6.1.4.1.674.10892.5.4.1100.50.1.8
  - 1.3.6.1.4.1.674.10892.5.4.1100.30.1.5
  - 1.3.6.1.4.1.674.10892.5.4.1100.30.1.26
  - 1.3.6.1.4.1.674.10892.5.4.700.20.1.8
  - 1.3.6.1.4.1.674.10892.5.4.700.20.1.5
  - 1.3.6.1.4.1.674.10892.5.4.700.12.1.8
  - 1.3.6.1.4.1.674.10892.5.4.700.12.1.5
  - 1.3.6.1.4.1.674.10892.5.4.600.60.1.6
  - 1.3.6.1.4.1.674.10892.5.4.600.60.1.5
  - 1.3.6.1.4.1.674.10892.5.4.1100.90.1.6
  - 1.3.6.1.4.1.674.10892.5.4.1100.90.1.3
  - 1.3.6.1.4.1.674.10892.5.5.1.20.130.4.1.2
  - 1.3.6.1.4.1.674.10892.5.5.1.20.130.4.1.24
  metrics:
  - name: memoryDeviceStatus
    oid: 1.3.6.1.4.1.674.10892.5.4.1100.50.1.5
    type: gauge
    indexes:
    - labelname: memoryDevicechassisIndex
      type: gauge
    - labelname: memoryDeviceIndex
      type: gauge
    lookups:
    - labels:
      - memoryDevicechassisIndex
      - memoryDeviceIndex
      labelname: memoryDeviceLocationName
      oid: 1.3.6.1.4.1.674.10892.5.4.1100.50.1.8
      type: DisplayString

  - name: processorDeviceStatus
    oid: 1.3.6.1.4.1.674.10892.5.4.1100.30.1.5
    type: gauge
    indexes:
    - labelname: processorDevicechassisIndex
      type: gauge
    - labelname: processorDeviceIndex
      type: gauge
    lookups:
    - labels:
      - processorDevicechassisIndex
      - processorDeviceIndex
      labelname: processorDeviceFQDD
      oid: 1.3.6.1.4.1.674.10892.5.4.1100.30.1.26
      type: DisplayString

  - name: temperatureProbeStatus
    oid: 1.3.6.1.4.1.674.10892.5.4.700.20.1.5
    type: gauge
    indexes:
    - labelname: temperatureProbechassisIndex
      type: gauge
    - labelname: temperatureProbeIndex
      type: gauge
    lookups:
    - labels:
      - temperatureProbechassisIndex
      - temperatureProbeIndex
      labelname: temperatureProbeLocationName
      oid: 1.3.6.1.4.1.674.10892.5.4.700.20.1.8
      type: DisplayString

  - name: coolingDeviceStatus
    oid: 1.3.6.1.4.1.674.10892.5.4.700.12.1.5
    type: gauge
    indexes:
    - labelname: coolingDevicechassisIndex
      type: gauge
    - labelname: coolingDeviceIndex
      type: gauge
    lookups:
    - labels:
      - coolingDevicechassisIndex
      - coolingDeviceIndex
      labelname: coolingDeviceLocationName
      oid: 1.3.6.1.4.1.674.10892.5.4.700.12.1.8
      type: DisplayString

  - name: powerUsageStatus
    oid: 1.3.6.1.4.1.674.10892.5.4.600.60.1.5
    type: gauge
    indexes:
    - labelname: powerUsageChassisIndex
      type: gauge
    - labelname: powerUsageIndex
      type: gauge
    lookups:
    - labels:
      - powerUsageChassisIndex
      - powerUsageIndex
      labelname: powerUsageEntityName
      oid: 1.3.6.1.4.1.674.10892.5.4.600.60.1.6
      type: DisplayString

  - name: networkDeviceStatus
    oid: 1.3.6.1.4.1.674.10892.5.4.1100.90.1.3
    type: gauge
    indexes:
    - labelname: networkDeviceChassisIndex
      type: gauge
    - labelname: networkDeviceIndex
      type: gauge
    lookups:
    - labels:
      - networkDeviceChassisIndex
      - networkDeviceIndex
      labelname: networkDeviceProductName
      oid: 1.3.6.1.4.1.674.10892.5.4.1100.90.1.6
      type: DisplayString

  - name: physicalDiskComponentStatus
    oid: 1.3.6.1.4.1.674.10892.5.5.1.20.130.4.1.24
    type: gauge
    indexes:
    - labelname: physicalDiskNumber
      type: gauge

    lookups:
    - labels:
      - physicalDiskNumber
      labelname: physicalDiskName
      oid: 1.3.6.1.4.1.674.10892.5.5.1.20.130.4.1.2
      type: DisplayString

  version: 2
{{- if .Values.global.snmp -}}
{{- if .Values.global.snmp.baremetal -}}
{{- if .Values.global.snmp.baremetal.auth }}
  auth:
{{ toYaml .Values.global.snmp.baremetal.auth | indent 4 -}}
{{- end -}}
{{- end -}}
{{- end }}
