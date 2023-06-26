FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

COPY dependency/simh/simh /tmp/simh/simh

RUN apt update -y && \
    apt install -y --no-install-recommends \
        make \
        gcc \
        git \
        libpcap-dev \
        libvdeplug-dev \
        libpcre3-dev \
        libedit-dev \
        libsdl2-dev \
        libpng-dev \
        libsdl2-ttf-dev \
        && \
    apt clean all

RUN make -C /tmp/simh/simh pdp11

RUN cp /tmp/simh/simh/BIN/pdp11 /usr/local/bin/pdp11 && \
    rm -rf /tmp/simh

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY unix_v6.ini /work/unix_v6.ini
COPY dependency/simh.trailing-edge.com/uv6swre/unix0_v6_rk.dsk /work/unix0_v6_rk.dsk
COPY dependency/simh.trailing-edge.com/uv6swre/unix1_v6_rk.dsk /work/unix1_v6_rk.dsk
COPY dependency/simh.trailing-edge.com/uv6swre/unix2_v6_rk.dsk /work/unix2_v6_rk.dsk
COPY dependency/simh.trailing-edge.com/uv6swre/unix3_v6_rk.dsk /work/unix3_v6_rk.dsk

WORKDIR /work

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["/usr/local/bin/pdp11", "unix_v6.ini"]
