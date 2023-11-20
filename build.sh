#!/bin/bash

cat images | xargs -I{} docker pull {}
docker image save $(cat images | xargs) -o bundle_file

docker build -t k3s-full .
