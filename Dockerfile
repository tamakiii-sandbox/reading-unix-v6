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

RUN make -C /tmp/simh/simh pdp11 && \
    cp /tmp/simh/simh/BIN/pdp11 /usr/local/bin/pdp11 && \
    rm -rf /tmp/simh

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "/usr/local/bin/pdp11" ]
