#!/bin/bash

# Usage: ./deploy.sh [host]

if [ "$#" -ne 2 ]; then
    echo "Usage: ./deploy.sh [attributes_file.json] [<user@>host]"
    exit -1
fi

attributes_file=$1
host=$2


tar cj . | ssh -t -o 'StrictHostKeyChecking no' "$host" "
sudo rm -rf ~/chef &&
mkdir ~/chef &&
cd ~/chef &&
tar xj &&
sudo bash install.sh $attributes_file"

