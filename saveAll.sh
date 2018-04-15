#!/usr/bin/env bash
#
# Build all docker images

# Exit the script when a command fails
set -e
# Exit the script when a variable is undeclared
set -u

readonly CURRENT_DIRECTORY="$(cd "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

save(){
    docker save ${1} | gzip > ${2}
}

main() {
    local destinyFolder=${1}
    local tag=${2}

    save "com.ateknea.bettair/frontend-proxy:${tag}" "${destinyFolder}/frontend-proxy_${tag}.tar.gz"
    save "com.ateknea.bettair/api:${tag}" "${destinyFolder}/api_${tag}.tar.gz"
    save "com.ateknea.bettair/ngsi-proxy:${tag}" "${destinyFolder}/ngsi-proxy_${tag}.tar.gz"
    save "com.ateknea.bettair/iot_agent:${tag}" "${destinyFolder}/iot_agent_${tag}.tar.gz"
    save "cygnus-ngsi" "${destinyFolder}/cygnus-ngsi${tag}.tar.gz"
    save "com.ateknea.bettair/keyrock:1.0.0" "${destinyFolder}/keyrock_${tag}.tar.gz"
    save "com.ateknea.bettair/wilma_orion:${tag}" "${destinyFolder}/wilma_orion${tag}.tar.gz"
    save "com.ateknea.bettair/wilma_api:${tag}" "${destinyFolder}/wilma_api${tag}.tar.gz"
    save "com.ateknea.bettair/bet-devices:${tag}" "${destinyFolder}/bet-devices_${tag}.tar.gz"


}

if [[ "$0" == "${BASH_SOURCE[0]}" ]]; then
    main "$@"
fi
