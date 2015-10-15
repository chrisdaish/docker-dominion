FROM ubuntu:14.04.3

MAINTAINER chrisdaish@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install --no-install-recommends -y curl \
                                                  libgl1-mesa-glx \
                                                  libxcursor1 \
                                                  libxrandr2 \
    && rm -rf /var/lib/apt/lists/*

ENV DOMINION_INSTALLER Dominion_v2-0-42-1.tar.gz

RUN curl -skLo /tmp/$DOMINION_INSTALLER https://dominion.makingfun.co/$DOMINION_INSTALLER \
    && mkdir -p /opt/Dominion \
    && tar -xzf /tmp/$DOMINION_INSTALLER -C /opt/Dominion \
    && rm -rf /tmp/$DOMINION_INSTALLER

CMD ["/opt/Dominion/Dominion.x86_64"]
