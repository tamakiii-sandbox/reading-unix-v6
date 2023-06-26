.PHONY: help build bash clean

IMAGE := tamakiii-sandbox/reading-unix-v6
TAG := latest

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	depencency/simh/simh

build: Dockerfile
	docker build -t $(IMAGE):$(TAG) .

bash:
	docker run -it --rm -v /tmp -w /tmp $(IMAGE):$(TAG) $@

teardown:
	rm -rf depencency

clean:
	docker rmi $(IMAGE):$(TAG)

depencency/simh/simh: depencency/simh
	git clone git@github.com:simh/simh.git $@

depencency/simh:
	mkdir -p $@
