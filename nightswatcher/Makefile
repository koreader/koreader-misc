VERSION=0.4.6

all: build

build:
	docker build --rm=true -t koreader/nightswatcher:$(VERSION) .

run:
	docker run --name nightswatcher -d koreader/nightswatcher:$(VERSION)

push:
	docker push koreader/nightswatcher:$(VERSION)
	docker tag koreader/nightswatcher:$(VERSION) koreader/nightswatcher:latest
	docker push koreader/nightswatcher:latest
