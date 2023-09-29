REPO = shok1122
IMG = ruby
VERSION = 3.2.2

build:
	docker build -t ${REPO}/${IMG}:${VERSION} .
push:
	docker push ${REPO}/${IMG}:${VERSION}
run:
	docker run -it --rm ${REPO}/${IMG}:${VERSION}
