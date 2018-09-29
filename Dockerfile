FROM debian:stretch-slim

ENV NOMAD_VERSION "0.8.6"

RUN apt update && apt install curl jq coreutils

ADD https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip nomad.zip
RUN unzip nomad.zip
RUN mv nomad /usr/bin/nomad
RUN chmod +x /usr/bin/nomad

COPY bin/* /opt/resource
