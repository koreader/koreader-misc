VERSION=0.7.0

all: build

build:
	docker build --rm=true -t koreader/nightswatcher:$(VERSION) .
	docker tag koreader/nightswatcher:$(VERSION) koreader/nightswatcher:latest

run:
	docker run --name nightswatcher -d koreader/nightswatcher:$(VERSION)

shell:
	docker run --detach-keys "ctrl-q,ctrl-q" --rm -t -i koreader/nightswatcher:$(VERSION) bash -l

push:
	docker push koreader/nightswatcher:$(VERSION)
	docker push koreader/nightswatcher:latest

.PHONY: all build run push shell
