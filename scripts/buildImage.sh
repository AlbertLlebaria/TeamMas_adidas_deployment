#!/usr/bin/env bash
#

# Exit the script when a command fails
set -e
# Exit the script when a variable is undeclared
set -u

readonly CURRENT_DIRECTORY="$(pwd)"

source "${CURRENT_DIRECTORY}/imageConfig.sh"

# usage: build_image [tag]
build_image() {
    # Generate image name
    local name="${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"

    echo "Building image ${name}"

    # Run docker with the provided arguments
    docker build -t "${name}" \
                  "${CURRENT_DIRECTORY}/docker"
}

copy_source_to_docker_context_folder() {
    local sourceDir="$1"
    local destinationDir="${CURRENT_DIRECTORY}/docker/tmp/"

    mkdir "${destinationDir}"
    cp -r "${sourceDir}" "${destinationDir}"
}

rm_tmp_folder() {
    rm -rf "${CURRENT_DIRECTORY}/docker/tmp/"
}

main() {
    local source_directory=""

    while getopts ':s:' OPT; do
        case "${OPT}" in
            s)
                source_directory="${OPTARG}"
                ;;
            ?)
                echo "invalid argument: ${OPTARG}"
                exit 1
                ;;
        esac
    done

    if [[ -z "${source_directory}" ]]; then
        echo "Source file or directory must be specified using -s {source_directory}"
        exit 1
    fi

    rm_tmp_folder
    copy_source_to_docker_context_folder "${source_directory}"
    build_image
    rm_tmp_folder
}

if [[ "$0" == "${BASH_SOURCE[0]}" ]]; then
    main "$@"
fi