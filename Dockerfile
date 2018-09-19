FROM ubuntu:xenial
MAINTAINER oliver@weichhold.com

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.17.2.0/s6-overlay-amd64.tar.gz \
    https://github.com/eveybcd/BitcoinDiamond/releases/download/v1.1.0/bitcoindiamond-1.1.0-x86_64-linux-gnu.tar.gz /tmp/

RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C / && \
    cd /tmp && tar xvf bitcoindiamond*.tar.gz && cp -r /tmp/bitcoindiamond*/bin/* /usr/bin && \
    rm -rf /usr/share/man/* /usr/share/groff/* /usr/share/info/* /var/cache/man/* /tmp/* /var/lib/apt/lists/*

EXPOSE 16101 16102 16103

ENTRYPOINT ["/init"]
VOLUME ["/data"]
ADD rootfs /
