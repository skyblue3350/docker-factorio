FROM ubuntu:20.04

MAINTAINER skyblue3350

WORKDIR /opt

ENV FACTORIO_VERSION=1.1.35 \
    FACTORIO_SAVE_NAME=world

RUN apt-get update -y && apt-get install -y wget xz-utils \
 && wget https://www.factorio.com/get-download/${FACTORIO_VERSION}/headless/linux64 \
 && tar Jxvf linux64 \
 && rm -rf linux64 \
 && apt-get remove -y wget xz-utils \
 && rm -rf /var/cache/apk/* /tmp/*

EXPOSE 34197/udp

WORKDIR /world
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--start-server", "$FACTORIO_SAVE_NAME"]
