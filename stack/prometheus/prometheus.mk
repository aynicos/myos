ENV_VARS                                  += PROMETHEUS_BLACKBOX_PRIMARY_TARGETS PROMETHEUS_BLACKBOX_SECONDARY_TARGETS PROMETHEUS_SERVICE_9090_TAGS
PROMETHEUS_BLACKBOX_PRIMARY_TARGETS       ?= $(patsubst %,https://%,$(DOMAIN))
PROMETHEUS_BLACKBOX_SECONDARY_TARGETS     ?= $(patsubst %,https://%,$(APP_URIS))
PROMETHEUS_SERVICE_URIS                   ?= $(patsubst %,alertmanager.%,$(APP_URIS))
PROMETHEUS_SERVICE_9090_TAGS              ?= $(call urlprefix,,$(PROMETHEUS_SERVICE_9090_URIS))
PROMETHEUS_SERVICE_9090_URIS              ?= $(PROMETHEUS_SERVICE_URIS)
