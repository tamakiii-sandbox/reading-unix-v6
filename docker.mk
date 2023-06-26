.PHONY: help build bash clean

IMAGE := tamakiii-sandbox/reading-unix-v6
TAG := latest

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup:
	$(MAKE) -f dependency.mk build

build: Dockerfile
	docker build -t $(IMAGE):$(TAG) .

bash:
	docker run -it --rm -v /tmp -w /tmp $(IMAGE):$(TAG) $@

teardown:
	$(MAKE) -f dependency.mk clean

clean:
	docker rmi $(IMAGE):$(TAG)
