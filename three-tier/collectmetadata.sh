#!/bin/bash

hostname="169.254.169.254"

#The Azure Instance Metadata service(IMDS) provides information about currently running Linux VM Instance
# Getting the Aure Linux Machine Metadata in the JSON Format
sudo apt-get install curl
sudo apt-get install jq

#API call

curl -s -H Metadata:true --noproxy "*" "http://${hostname}/metadata/instance?api-version=2021-02-01" | jq > metadata.json