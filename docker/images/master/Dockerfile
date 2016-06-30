FROM ubuntu:trusty
MAINTAINER Dennis Hoppe <hoppe@hlrs.de>

RUN apt-get update && apt-get install -y \
    curl \
    git

WORKDIR "/"
RUN git clone --recursive https://github.com/hopped/hyperflow-deployment

WORKDIR "/hyperflow-deployment"
RUN git checkout develop
RUN bash install.sh attributes/redis.json
RUN bash install.sh attributes/rabbitmq.json
RUN bash install.sh attributes/hyperflow.json
RUN bash install.sh attributes/hyperflow-ui.json

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
