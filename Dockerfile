FROM ubuntu:focal-20220316

ARG UNIFI_DEB=unifi_sysvinit_all.deb
ARG UNIFI_VER=7.0.23
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends ./$UNIFI_DEB && \
    rm -rf /var/lib/apt/lists/*
