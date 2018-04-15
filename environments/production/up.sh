#!/usr/bin/env bash
#
# Run BET platform

# Exit the script when a command fails
set -e
# Exit the script when a variable is undeclared
set -u


main() {
#   Deploy platform
    docker-compose -f docker-compose-develop.yml up -d keystone
    sleep 1m
    docker-compose -f docker-compose-production.yml up -d
}

if [[ "$0" == "${BASH_SOURCE[0]}" ]]; then
    main "$@"
fi