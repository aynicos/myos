BUILD_APP_VARS                  ?= APP BRANCH COMMIT DEPLOY_SLACK_HOOK ENV VERSION
COMPOSE_IGNORE_ORPHANS          ?= false
ENV_VARS                        += CONSUL_HTTP_TOKEN