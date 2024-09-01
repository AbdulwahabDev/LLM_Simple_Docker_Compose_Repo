#! /usr/bin/env sh
set -e

ENV_FILE_PATH='./digitalocean_registry.env'
# Load the .env file
if [ -f $ENV_FILE_PATH ]; then
    export $(cat $ENV_FILE_PATH | sed 's/#.*//g' | xargs)
fi
 
echo "=========== logout ==============" 
doctl auth remove --context default
docker logout registry.digitalocean.com


echo "=========== login ================" 
export DIGITALOCEAN_ACCESS_TOKEN=$digitalocean_token
doctl auth init
echo $digitalocean_token | docker login registry.digitalocean.com --username $digitalocean_USERNAME --password-stdin
