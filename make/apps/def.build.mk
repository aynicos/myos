BUILD_AUTHOR                    ?= $(DOCKER_AUTHOR)
BUILD_DATE                      ?= $(shell TZ=UTC date "+%Y%m%dT%H%M%SZ" 2>/dev/null)
BUILD_DESCRIPTION               ?= Lot of Love
BUILD_DOCUMENTATION             ?= $(APP_REPOSITORY_URL)$(if $(wildcard README.md),/blob/$(COMMIT)/README.md)
BUILD_ENV_VARS                  ?= APP BRANCH BUILD_DATE BUILD_STATUS COMMIT DEPLOY_HOOK_URL ENV UID USER VERSION
BUILD_LABEL_VARS                ?= org.label-schema.% org.opencontainers.% os.my.%
BUILD_LABEL_ARGS                ?= $(foreach var,$(filter $(BUILD_LABEL_VARS),$(MAKE_FILE_VARS)),$(if $($(var)),$(var)='$($(var))'))
BUILD_LICENSE                   ?= GPL-3.0
BUILD_NAME                      ?= $(COMPOSE_SERVICE_NAME)-$(BUILD_SERVICE)
BUILD_SERVICE                   ?= $(or $(service),undefined)
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
org.label-schema.vcs-url                ?= $(APP_REPOSITORY_URL)
org.label-schema.vendor                 ?= $(BUILD_AUTHOR)
org.label-schema.version                ?= $(VERSION)
org.opencontainers.build_tool.revision  ?= $(MYOS_COMMIT)
org.opencontainers.build_tool.source    ?= $(MYOS_REPOSITORY)
org.opencontainers.image.authors        ?= $(BUILD_AUTHOR)
org.opencontainers.image.created        ?= $(BUILD_DATE)
org.opencontainers.image.description    ?= $(BUILD_DESCRIPTION)
org.opencontainers.image.documentation  ?= $(BUILD_DOCUMENTATION)
org.opencontainers.image.licenses       ?= $(BUILD_LICENSE)
org.opencontainers.image.revision       ?= $(COMMIT)
org.opencontainers.image.source         ?= $(APP_REPOSITORY_URL)
org.opencontainers.image.title          ?= $(BUILD_NAME)
org.opencontainers.image.url            ?= $(APP_URL)
org.opencontainers.image.vendor         ?= $(BUILD_AUTHOR)
org.opencontainers.image.version        ?= $(VERSION)
os.my.app                               ?= $(APP)
os.my.build.status                      ?= $(BUILD_STATUS)
os.my.compose.file                      ?= $(COMPOSE_FILE)
os.my.compose.project.name              ?= $(COMPOSE_PROJECT_NAME)
os.my.env                               ?= $(ENV)
os.my.uid                               ?= $(UID)
os.my.service                           ?= $(BUILD_SERVICE)
os.my.version                           ?= $(VERSION)
