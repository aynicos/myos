ANSIBLE_AWS_ACCESS_KEY_ID       ?= $(AWS_ACCESS_KEY_ID)
ANSIBLE_AWS_DEFAULT_OUTPUT      ?= $(AWS_DEFAULT_OUTPUT)
ANSIBLE_AWS_DEFAULT_REGION      ?= $(AWS_DEFAULT_REGION)
ANSIBLE_AWS_SECRET_ACCESS_KEY   ?= $(AWS_SECRET_ACCESS_KEY)
ANSIBLE_CONFIG                  ?= ansible/ansible.cfg
ANSIBLE_DISKS_NFS_DISK          ?= $(NFS_DISK)
ANSIBLE_DISKS_NFS_OPTIONS       ?= $(NFS_OPTIONS)
ANSIBLE_DISKS_NFS_PATH          ?= $(NFS_PATH)
ANSIBLE_DOCKER_IMAGE_TAG        ?= $(DOCKER_IMAGE_TAG)
ANSIBLE_DOCKER_REGISTRY         ?= $(DOCKER_REGISTRY)
ANSIBLE_EXTRA_VARS              ?= target=localhost
ANSIBLE_GIT_DIRECTORY           ?= /src/$(subst git@,,$(subst ssh://,,$(GIT_REPOSITORY)))
ANSIBLE_GIT_KEY_FILE            ?= $(if $(ANSIBLE_SSH_PRIVATE_KEYS),~$(ANSIBLE_USERNAME)/.ssh/$(notdir $(firstword $(ANSIBLE_SSH_PRIVATE_KEYS))))
ANSIBLE_GIT_REPOSITORY          ?= $(GIT_REPOSITORY)
ANSIBLE_GIT_VERSION             ?= $(BRANCH)
ANSIBLE_INVENTORY               ?= ansible/inventories
ANSIBLE_PLAYBOOK                ?= ansible/playbook.yml
ANSIBLE_SSH_PRIVATE_KEYS        ?= $(SSH_PRIVATE_KEYS)
ANSIBLE_SERVER_NAME             ?= $(SERVER_NAME)
ANSIBLE_USERNAME                ?= root
ANSIBLE_VERBOSE                 ?= $(if $(DEBUG),-vvvv,$(if $(VERBOSE),-v))
CMDS                            += ansible ansible-playbook
DOCKER_RUN_OPTIONS              += --add-host=host.docker.internal:$(DOCKER_INTERNAL_DOCKER_HOST)
ENV_VARS                        += ANSIBLE_AWS_ACCESS_KEY_ID ANSIBLE_AWS_DEFAULT_OUTPUT ANSIBLE_AWS_DEFAULT_REGION ANSIBLE_AWS_SECRET_ACCESS_KEY ANSIBLE_CONFIG ANSIBLE_DISKS_NFS_DISK ANSIBLE_DISKS_NFS_OPTIONS ANSIBLE_DISKS_NFS_PATH ANSIBLE_DOCKER_IMAGE_TAG ANSIBLE_DOCKER_REGISTRY ANSIBLE_EXTRA_VARS ANSIBLE_GIT_DIRECTORY ANSIBLE_GIT_KEY_FILE ANSIBLE_GIT_REPOSITORY ANSIBLE_GIT_VERSION ANSIBLE_INVENTORY ANSIBLE_PLAYBOOK ANSIBLE_SSH_PRIVATE_KEYS ANSIBLE_USERNAME ANSIBLE_VERBOSE

ifeq ($(DOCKER), true)
define ansible
	$(call INFO,ansible,$(1))
	$(call run,$(DOCKER_REPOSITORY)/ansible:$(DOCKER_IMAGE_TAG) $(ANSIBLE_ARGS) -i $(ANSIBLE_INVENTORY)/.host.docker.internal $(ANSIBLE_VERBOSE) $(1))
endef
define ansible-playbook
	$(call INFO,ansible-playbook,$(1))
	$(call run,--entrypoint=ansible-playbook $(DOCKER_REPOSITORY)/ansible:$(DOCKER_IMAGE_TAG) $(ANSIBLE_ARGS) -i $(ANSIBLE_INVENTORY)/.host.docker.internal $(ANSIBLE_VERBOSE) $(1))
endef
define ansible-pull
	$(call INFO,ansible-pull,$(1))
	# TODO : run ansible in docker and target localhost outside docker
	$(call env-exec,ansible-pull $(ANSIBLE_ARGS) $(ANSIBLE_VERBOSE) $(1))
endef
else
# function ansible: Call run ansible ANSIBLE_ARGS with arg 1
define ansible
	$(call INFO,ansible,$(1))
	$(call run,ansible $(ANSIBLE_ARGS) $(ANSIBLE_VERBOSE) $(1))
endef
# function ansible-playbook: Call run ansible-playbook ANSIBLE_ARGS with arg 1
define ansible-playbook
	$(call INFO,ansible-playbook,$(1))
	$(call run,ansible-playbook $(ANSIBLE_ARGS) $(ANSIBLE_VERBOSE) $(1))
endef
# function ansible-pull: Call run ansible-pull ANSIBLE_ARGS with arg 1
define ansible-pull
	$(call INFO,ansible-pull,$(1))
	$(call run,ansible-pull $(ANSIBLE_ARGS) $(ANSIBLE_VERBOSE) $(1))
endef
endif
