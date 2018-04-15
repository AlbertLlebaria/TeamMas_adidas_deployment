#!/usr/bin/env bash
#
# Build all docker images

# Exit the script when a command fails
set -e
# Exit the script when a variable is undeclared
set -u

readonly CURRENT_DIRECTORY="$(cd "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

build(){
    cd "${CURRENT_DIRECTORY}/${1}"
    ../../scripts/buildImage.sh -s ${2}
}

main() {
    build "modules/frontend-proxy" ../../../bettair_frontend/bettairapp/build/
    build "modules/apiRest" ../../../bettair_backend/target/bettair-api-0.0.1-SNAPSHOT.jar
    build "modules/IoTAgent" ../../../bettair_iot_agent/
    build "modules/ngsi-proxy" ../../../bettair_ngsi_proxy/
    build "modules/bet-devices" ../../../bettair_devices/
    docker build -t cygnus-ngsi ${CURRENT_DIRECTORY}/modules/cygnus-ngsi/docker
    docker build -t com.ateknea.bettair/keyrock:0.0.1 ${CURRENT_DIRECTORY}/modules/keystone/docker
    docker build -t com.ateknea.bettair/wilma_api:0.0.1-SNAPSHOT  ${CURRENT_DIRECTORY}/modules/docker_wilma/docker_api
    docker build -t com.ateknea.bettair/wilma_orion:0.0.1-SNAPSHOT  ${CURRENT_DIRECTORY}/modules/docker_wilma/docker_orion


}

if [[ "$0" == "${BASH_SOURCE[0]}" ]]; then
    main "$@"
fi
