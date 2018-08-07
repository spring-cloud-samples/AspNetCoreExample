#!/bin/bash
echo "Building docker"
pushd docker
  docker-compose build
  docker-compose up -d
  echo "Waiting 5 seconds for artifactory to start"
  sleep 5
popd
