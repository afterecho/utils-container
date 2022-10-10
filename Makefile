VERSION := 1.0

all: build push

build:
	docker build -t afterecho/utils:latest -t afterecho/utils:${VERSION} .

push:
	docker push afterecho/utils:latest
	docker push afterecho/utils:${VERSION}
