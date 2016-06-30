FROM ubuntu:trusty

RUN apt-get update && apt-get install -y \
    curl \
    git \
    jq \
    wget

ENV DOCKERIZE_VERSION v0.2.0
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

WORKDIR "/"
RUN git clone --recursive https://github.com/hopped/hyperflow-deployment

WORKDIR "/hyperflow-deployment"
RUN git checkout develop

WORKDIR "/hyperflow-deployment/scripts/worker"
RUN bash install.sh

WORKDIR "/root"
RUN gem install mime-types

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
