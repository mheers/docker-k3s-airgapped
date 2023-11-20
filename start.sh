#!/bin/bash

source ./.env

# K3S_VERSION=v1.27.7-k3s2
K3S_TOKEN=${RANDOM}${RANDOM}${RANDOM} docker-compose up
