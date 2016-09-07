#!/bin/bash
ROOT=../..
cd ${ROOT}

# Set URLs to access RabbitMQ and Redis
echo amqp://localhost:5672 > AMQP_URL
echo redis://localhost:6379 > REDIS_URL
