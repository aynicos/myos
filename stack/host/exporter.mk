ENV_VARS                                  += HOST_EXPORTER_CADVISOR_SERVICE_8080_TAGS HOST_EXPORTER_NODE_SERVICE_9100_TAGS
HOST_EXPORTER_CADVISOR_SERVICE_8080_NAME  ?= cadvisor-exporter
HOST_EXPORTER_CADVISOR_SERVICE_8080_TAGS  ?= $(call tagprefix,HOST_EXPORTER_CADVISOR,8080)
HOST_EXPORTER_NODE_SERVICE_9100_NAME      ?= node-exporter
HOST_EXPORTER_NODE_SERVICE_9100_TAGS      ?= $(call tagprefix,HOST_EXPORTER_NODE,9100)
