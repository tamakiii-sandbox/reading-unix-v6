.PHONY: help build bash pdp11 clean

IMAGE := tamakiii-sandbox/reading-unix-v6
TAG := latest

run = docker run -it --rm $(IMAGE):$(TAG) $1

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup:
	$(MAKE) -f dependency.mk build

build: Dockerfile
	docker build -t $(IMAGE):$(TAG) .

bash:
	$(call run,$@)

pdp11:
	$(call run)

teardown:
	$(MAKE) -f dependency.mk clean

clean:
	docker rmi $(IMAGE):$(TAG)
