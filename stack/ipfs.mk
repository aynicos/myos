ENV_VARS                        += IPFS_PROFILE IPFS_VERSION
IPFS_PROFILE                    ?= $(if $(filter-out amd64 x86_64,$(PROCESSOR_ARCHITECTURE)),lowpower,server)
IPFS_VERSION                    ?= 0.14.0

.PHONY: bootstrap-stack-ipfs
bootstrap-stack-ipfs: ~/.ipfs

~/.ipfs:
	mkdir -p ~/.ipfs