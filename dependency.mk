.PHONY: help build clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: \
	dependency/simh/simh \
	dependency/memnoth/unix-v6

clean:
	rm -rf dependency

dependency/simh/simh: dependency/simh
	test -d $@ && git -C $@ pull || git clone git@github.com:simh/simh.git $@

dependency/memnoth/unix-v6: dependency/memnoth
	test -d $@ && git -C $@ pull || git clone git@github.com:memnoth/unix-v6.git $@

dependency/simh: dependency
	mkdir -p $@

dependency/memnoth: dependency
	mkdir -p $@

dependency:
	mkdir -p $@
