ENV_VARS                                  += IPFS_API_HTTPHEADERS_ACA_ORIGIN IPFS_DAEMON_ARGS IPFS_PROFILE IPFS_SERVICE_5001_TAGS IPFS_SERVICE_8080_TAGS IPFS_VERSION
IPFS_API_HTTPHEADERS_ACA_ORIGIN           ?= [$(call patsublist,%,"https://%",$(IPFS_SERVICE_8080_URIS))]
IPFS_PROFILE                              ?= $(if $(filter-out amd64 x86_64,$(MACHINE)),lowpower,server)
IPFS_SERVICE_NAME                         ?= ipfs
IPFS_SERVICE_5001_PATH                    ?= api/
IPFS_SERVICE_5001_TAGS                    ?= $(call tagprefix,ipfs,5001)
IPFS_SERVICE_8080_CHECK_HTTP              ?= /ipfs/QmUNLLsPACCz1vLxQVkXqqLX5R1X345qqfHbsf67hvA3Nn
IPFS_SERVICE_8080_TAGS                    ?= $(call tagprefix,ipfs,8080)
IPFS_SERVICE_8080_URIS                    ?= $(patsubst %,ipfs.%,$(APP_URIS)) $(patsubst %,*.ipfs.%,$(APP_URIS)) $(patsubst %,ipns.%,$(APP_URIS)) $(patsubst %,*.ipns.%,$(APP_URIS))
IPFS_VERSION                              ?= 0.16.0

.PHONY: bootstrap-stack-ipfs
bootstrap-stack-ipfs: ~/.ipfs setup-sysctl

~/.ipfs:
	mkdir -p ~/.ipfs
