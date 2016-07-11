#!/bin/bash

echo "Docker mode? ${DOCKER_TESTING}"
echo "AMQP URL: ${PUBLIC_RabbitMQ_Required_by_Worker}"

# new: use a pre-compiled version of Ruby
if [ -n "${DOCKER_TESTING}" ]; then
  echo "nothing to do"
else
  curl https://s3.amazonaws.com/pkgr-buildpack-ruby/current/ubuntu-14.04/ruby-2.1.4.tgz -o - | tar xzf - -C /usr/local
fi

# set environment variables
STORAGE=cloud
if [ $# -ne 3 ]; then
  STORAGE=local
  echo "Using LOCAL storage for storing simulation results"
fi

ROOT=../..
cd ${ROOT}

FILES=( "attributes/executor.json" "attributes/hyperflow-md-worker.json" "attributes/docker-worker-postbuilt.json" "attributes/amqp-executor-template.json" )
for FILE in "${FILES[@]}"
do
  if [ ${STORAGE} == "cloud" ]; then
    export AWS_REGION=$1
    export AWS_ACCESS_KEY_ID=$2
    export AWS_SECRET_ACCESS_KEY=$3
    if [ -f ${FILE} ]; then
      echo "${FILE}: Using CLOUD storage for storing simulation results"
      cat ${FILE} | jq --arg z ${AWS_REGION} --arg x ${AWS_ACCESS_KEY_ID} --arg y ${AWS_SECRET_ACCESS_KEY} '.amqp_executor=(.amqp_executor + { STORAGE: "cloud", REGION: $z, AWS_ACCESS_KEY_ID: $x, AWS_SECRET_ACCESS_KEY: $y })' > tmp.json
      mv tmp.json ${FILE}
    fi
  fi
  if [ -f ${FILE} ]; then
    echo "${FILE}: Updating URL for AMQP"
    cat ${FILE} | jq --arg x amqp://${PUBLIC_RabbitMQ_Required_by_Worker} '.amqp_executor=(.amqp_executor + { AMQP_URL: $x })' > tmp.json
    mv tmp.json ${FILE}
  fi
done

echo amqp://$PUBLIC_RabbitMQ_Required_by_Worker > AMQP_URL

# install remaining packages
if [ -n "${DOCKER_TESTING}" ]; then
  echo "nothing to do"
else
  bash install.sh attributes/hyperflow-md-worker.json
fi
