# Run Dominion from http://www.playdominion.com inside a container.
#
# docker run -d \
#   -e DISPLAY=unix$DISPLAY \
#   -e uid=$(id -u) \
#   -e gid=$(id -g) \
#   -v /etc/localtime:/etc/localtime:ro \
#   -v /tmp/.X11-unix:/tmp/.X11-unix \
#   --name dominion \
#   chrisdaish/dominion
#

FROM ubuntu:14.04.3

MAINTAINER chrisdaish@gmail.com

ENV DEBIAN_FRONTEND noninteractive
ENV uid 1000
ENV gid 1000

RUN useradd -m dominion

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

COPY start-dominion.sh /home/dominion/

ENTRYPOINT ["/home/dominion/start-dominion.sh"]
