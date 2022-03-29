FROM ubuntu:focal-20220316

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get -y install \
    --no-install-recommends \
    apt-transport-https \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*
    
RUN echo 'deb https://www.ui.com/downloads/unifi/debian stable ubiquiti' \
    | tee /etc/apt/sources.list.d/100-ubnt-unifi.list

ADD https://dl.ui.com/unifi/unifi-repo.gpg /etc/apt/trusted.gpg.d/unifi-repo.gpg
RUN chmod +r /etc/apt/trusted.gpg.d/unifi-repo.gpg

RUN apt-get update && \
    apt-cache madison unifi && \
    apt-get -y install \
    --no-install-recommends \
    unifi && \
    rm -rf /var/lib/apt/lists/*
