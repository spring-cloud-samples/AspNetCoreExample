#!/bin/bash

set -o errexit

pushd src/AspNetCoreExample
  ./run_tests.sh
popd
