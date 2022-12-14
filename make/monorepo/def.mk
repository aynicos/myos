CONTEXT                         += APPS DOMAIN RELEASE
DIRS                            ?= $(CONFIG) $(MAKE_DIR) $(SHARED)
MAKECMDARGS                     += copy master-tag release release-check release-create release-finish subrepo-push subrepo-update
RELEASE_UPGRADE                 ?= $(filter v%, $(shell git tag -l 2>/dev/null |sort -V |awk '/$(RELEASE)/,0'))
RELEASE_VERSION                 ?= $(firstword $(subst -, ,$(VERSION)))
SUBREPOS                        ?= $(filter subrepo/%, $(shell git remote 2>/dev/null))
