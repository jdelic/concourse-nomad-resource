FROM debian:stretch-slim

ENV NOMAD_VERSION "0.8.6"

RUN apt-get update && \
    apt-get -q -y -o DPkg::Options::=--force-confold \
    -o DPkg::Options::=--force-confdef install curl jq coreutils unzip

ADD https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip nomad.zip
RUN unzip nomad.zip && mv nomad /usr/bin/nomad && chmod +x /usr/bin/nomad && mkdir /opt/resource

COPY bin/* /opt/resource/
