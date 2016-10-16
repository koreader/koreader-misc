VERSION=0.1.1

all: build

build:
	docker build --rm=true -t $(USER)/nightswatcher:$(VERSION) .

run:
	docker run --name nightswatcher -d $(USER)/nightswatcher:$(VERSION)

push:
	docker push $(USER)/nightswatcher:$(VERSION)
