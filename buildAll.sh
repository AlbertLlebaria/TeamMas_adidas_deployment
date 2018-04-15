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
    build "modules/frontend-proxy" ../../../addidas_frontEnd/build/
    build "modules/modelname" ../../../adidas_backEnd/

}

if [[ "$0" == "${BASH_SOURCE[0]}" ]]; then
    main "$@"
fi
