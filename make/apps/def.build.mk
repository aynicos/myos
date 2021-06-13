BUILD_AUTHOR                    ?= $(DOCKER_AUTHOR)
BUILD_DATE                      ?= $(shell TZ=UTC date "+%d/%m/%YT%H:%M:%SZ" 2>/dev/null)
BUILD_DESCRIPTION               ?= Lot of Love
BUILD_DOCUMENTATION             ?= $(if $(wildcard README.md),$(APP_REPOSITORY)/blob/$(COMMIT)/README.md)
BUILD_ENV_VARS                  ?= APP BRANCH BUILD_DATE BUILD_STATUS COMMIT DEPLOY_HOOK_URL ENV VERSION
BUILD_LABEL_VARS                ?= org.label-schema.% org.opencontainers.% os.my.%
BUILD_LABEL_ARGS                ?= $(foreach var,$(filter $(BUILD_LABEL_VARS),$(MAKE_FILE_VARS)),$(if $($(var)),$(var)='$($(var))'))
BUILD_LICENSE                   ?= GPL-3.0
BUILD_NAME                      ?= $(COMPOSE_SERVICE_NAME)-$(BUILD_SERVICE)
BUILD_SERVICE                   ?= undef
BUILD_STATUS                    ?= $(shell git status -uno --porcelain 2>/dev/null)

org.label-schema.build-date             ?= $(BUILD_DATE)
org.label-schema.description            ?= $(BUILD_DESCRIPTION)
org.label-schema.docker.cmd             ?= docker run -d $(DOCKER_REGISTRY)/$(DOCKER_REPOSITORY)/$(BUILD_SERVICE):$(DOCKER_IMAGE_TAG)
org.label-schema.license                ?= GPLv3
org.label-schema.name                   ?= $(BUILD_NAME)
org.label-schema.schema-version         ?= 1.0
org.label-schema.url                    ?= $(APP_URL)
org.label-schema.usage                  ?= $(BUILD_DOCUMENTATION)
org.label-schema.vcs-ref                ?= $(COMMIT)
org.label-schema.vcs-url                ?= $(APP_REPOSITORY)
org.label-schema.vendor                 ?= $(BUILD_AUTHOR)
org.label-schema.version                ?= $(VERSION)
org.opencontainers.image.created        ?= $(BUILD_DATE)
org.opencontainers.image.revision       ?= $(COMMIT)
org.opencontainers.image.source         ?= $(APP_REPOSITORY)
org.opencontainers.image.url            ?= $(APP_URL)
org.opencontainers.image.vendor         ?= $(BUILD_AUTHOR)
org.opencontainers.image.version        ?= $(VERSION)
org.opencontainers.image.url            ?= $(APP_URL)
org.opencontainers.image.source         ?= $(APP_REPOSITORY)
org.opencontainers.image.version        ?= $(VERSION)
org.opencontainers.image.revision       ?= $(COMMIT)
org.opencontainers.image.vendor         ?= $(BUILD_AUTHOR)
org.opencontainers.image.title          ?= $(BUILD_NAME)
org.opencontainers.image.description    ?= $(BUILD_DESCRIPTION)
org.opencontainers.image.documentation  ?= $(BUILD_DOCUMENTATION)
org.opencontainers.build_tool.revision  ?= $(MYOS_COMMIT)
org.opencontainers.build_tool.source    ?= $(MYOS_REPOSITORY)
org.opencontainers.image.authors        ?= $(BUILD_AUTHOR)
org.opencontainers.image.licenses       ?= $(BUILD_LICENSE)
os.my.author                            ?= $(BUILD_AUTHOR)
os.my.date                              ?= $(BUILD_DATE)
os.my.name                              ?= $(BUILD_NAME)
os.my.status                            ?= $(BUILD_STATUS)
os.my.user                              ?= $(USER)
os.my.uid                               ?= $(UID)
os.my.version                           ?= $(VERSION)
