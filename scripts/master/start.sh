#!/bin/bash
WORKDIR=$1
S3_BUCKET=$2
S3_PATH=$3

# Start RabbitMQ service
service rabbitmq-server start

sleep 3

# Start Redis database
sed -i "s/bind\s127\.0\.0\.1/bind 0.0.0.0/" /etc/redis/redis.conf
/etc/init.d/redis-server restart

sleep 3

# Start HyperFlow as a server
nohup env PORT=51404 WORKDIR=${WORKDIR} S3_BUCKET=${S3_BUCKET} S3_PATH=${S3_PATH} AMQP_URL=$(cat /hyperflow-deployment/AMQP_URL) REDIS_URL=$(cat /hyperflow-deployment/REDIS_URL) /node_modules/hyperflow/bin/hflow start-server &

# Run UI on port 80
bash /hyperflow-ui/run.sh
