VERSION=0.6.4

all: build

build:
	docker build --rm=true -t koreader/nightswatcher:$(VERSION) .
	docker tag koreader/nightswatcher:$(VERSION) koreader/nightswatcher:latest

run:
	docker run --name nightswatcher -d koreader/nightswatcher:$(VERSION)

push:
	docker push koreader/nightswatcher:$(VERSION)
	docker push koreader/nightswatcher:latest
