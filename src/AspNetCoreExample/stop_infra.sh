#!/bin/bash

pushd docker
docker-compose kill || echo "Failed to kill docker"
popd
