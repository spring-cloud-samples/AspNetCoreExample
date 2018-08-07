#!/bin/bash

set -o errexit

echo -e "\n\nRunning tests against Artifactory\n\n"

if [[ "${REPO_WITH_BINARIES_FOR_UPLOAD}" == "" ]]; then
  # Start docker infra
  ./stop_infra.sh
  ./setup_infra.sh
fi

mkdir -p bin

# Kill & Run app
kill -9 `cat bin/pid.txt` && echo "Killed running dotnet app" || echo "Failed to kill app"
export ASPNETCORE_ENVIRONMENT="ContractTests"
export ASPNETCORE_SERVER_URLS="$( ./whats_my_ip.sh )"

nohup dotnet run &
echo $! > bin/pid.txt

# Execute contract tests
./run_contract_tests.sh

# Kill app
kill -9 `cat bin/pid.txt` && echo "Killed running dotnet app"
exit 0
