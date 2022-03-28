ARG UNIFI_DEB=unifi_sysvinit_all.deb

FROM curlimages/curl:7.82.0 AS curl

ARG UNIFI_DEB
ARG UNIFI_VER=7.0.23

WORKDIR /tmp
RUN curl -sLO "https://dl.ui.com/unifi/${UNIFI_VER}/${UNIFI_DEB}"

FROM ubuntu:focal-20220316

ARG DEBIAN_FRONTEND=noninteractive
ARG UNIFI_DEB

COPY --from=curl /tmp/$UNIFI_DEB .

RUN apt-get update && \
    apt-get -y install --no-install-recommends ./$UNIFI_DEB && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f $UNIFI_DEB
