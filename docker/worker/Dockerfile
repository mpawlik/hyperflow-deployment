FROM hoppe/mdworker:v5

ARG PUBLIC_RabbitMQ_Required_by_Worker=master:5672
ARG DOCKER_TESTING=1

WORKDIR "/"
RUN npm install https://github.com/hopped/hyperflow/archive/develop.tar.gz

WORKDIR "/hyperflow-deployment"
RUN git checkout develop
RUN git pull

WORKDIR "/hyperflow-deployment/scripts/worker"
RUN bash install.sh $AWS_ACCESS_KEY_ID $AWS_SECRET_ACCESS_KEY

WORKDIR "/hyperflow-deployment"
RUN bash install.sh attributes/amqp-executor-template.json

