#!/bin/bash

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi


uname=$(uname)
if [[ "${uname}" == "Darwin" ]]; then
  platform="darwin"
elif [[ "${uname}" == "Linux" ]]; then
  platform="linux"
else
  echo "Unknown, unsupported platform: (${uname})."
  echo "Supported platforms: Linux, Darwin."
  echo "Bailing out."
  exit 2
fi
# put binaries in opt
cd /opt 
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws


