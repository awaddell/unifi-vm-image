FROM ubuntu:focal-20220316

ARG UNIFI_DEB=unifi_sysvinit_all.deb
ARG UNIFI_VER=7.0.23
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y curl

# fetch from dipshit location
RUN curl -sLO "https://dl.ui.com/unifi/${UNIFI_VER}/${UNIFI_DEB}"

RUN apt-get install -y ./$UNIFI_DEB

