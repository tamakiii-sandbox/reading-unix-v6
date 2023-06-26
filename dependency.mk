.PHONY: help build clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: \
	dependency/simh/simh \
	dependency/memnoth/unix-v6 \
	dependency/simh.trailing-edge.com/uv6swre

clean:
	rm -rf dependency

dependency/simh/simh: dependency/simh
	test -d $@ && git -C $@ pull || git clone git@github.com:simh/simh.git $@

dependency/memnoth/unix-v6: dependency/memnoth
	test -d $@ && git -C $@ pull || git clone git@github.com:memnoth/unix-v6.git $@

dependency/simh.trailing-edge.com/uv6swre: dependency/simh.trailing-edge.com dependency/simh.trailing-edge.com/uv6swre.zip
	unzip -o $</*.zip -d $@

dependency/simh.trailing-edge.com/uv6swre.zip: dependency/simh.trailing-edge.com
	curl -so $@ http://simh.trailing-edge.com/kits/uv6swre.zip

dependency/simh: dependency
	mkdir -p $@

dependency/memnoth: dependency
	mkdir -p $@

dependency/simh.trailing-edge.com: dependency
	mkdir -p $@

dependency:
	mkdir -p $@
