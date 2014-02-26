#!/bin/bash

# Usage: ./deploy.sh [host]

if [ "$#" -lt 2 ]; then
    echo "Usage: ./deploy.sh [attributes_file.json] [<ssh args> <user@>host] "
    exit -1
fi

attributes_file=$1
shift
SSH_ARGS=$@ 

tar cj . | ssh -t -o 'StrictHostKeyChecking no' $SSH_ARGS "
sudo rm -rf ~/chef &&
mkdir ~/chef &&
cd ~/chef &&
tar xj &&
sudo bash install.sh $attributes_file"

