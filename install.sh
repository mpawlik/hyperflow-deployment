#!/bin/bash

# This runs as root on the server
# Do not run locally!


if [ "$#" -ne 1 ]; then
    echo "Usage: ./install.sh [attributes_file.json]"
    exit -1
fi

attributes_file=$1

chef_binary=/usr/bin/chef-solo


# Are we on a vanilla system?
if ! test -f "$chef_binary"; then
    #export DEBIAN_FRONTEND=noninteractive
    # Upgrade headlessly (this is only safe-ish on vanilla systems)
    #aptitude update &&
    #apt-get -o Dpkg::Options::="--force-confnew" \
    #    --force-yes -fuy dist-upgrade &&
    # Install  Chef
    curl -L https://www.opscode.com/chef/install.sh | sudo bash
fi &&

echo "Running chef-solo..."

"$chef_binary" -l debug -c solo.rb -j "$attributes_file"
