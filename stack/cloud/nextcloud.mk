ENV_VARS                                  += NEXTCLOUD_MYSQL_DATABASE NEXTCLOUD_MYSQL_USER NEXTCLOUD_SERVICE_80_TAGS
NEXTCLOUD_SERVICE_80_TAGS                 ?= $(patsubst %,urlprefix-%,$(NEXTCLOUD_SERVICE_80_URIS))
NEXTCLOUD_SERVICE_80_URIS                 ?= $(patsubst %,nextcloud.%,$(APP_URIS))
NEXTCLOUD_MYSQL_DATABASE                  ?= $(COMPOSE_SERVICE_NAME)-nextcloud
NEXTCLOUD_MYSQL_USER                      ?= $(NEXTCLOUD_MYSQL_DATABASE)
