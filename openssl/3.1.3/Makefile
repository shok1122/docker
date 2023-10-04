REPO = shok1122
IMG = openssl
VERSION = 3.1.3

build: ## build docker image
	docker build -t ${REPO}/${IMG}:${VERSION} .
push:  ## push docker image to registry
	docker push ${REPO}/${IMG}:${VERSION}
run:   ## run docker image
	docker run -it --rm ${REPO}/${IMG}:${VERSION} bash

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[33m%-16s\033[0m %s\n", $$1, $$2}'
