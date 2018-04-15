#!/usr/bin/env bash
#
# Shut down the BET platform

# Exit the script when a command fails
set -e
# Exit the script when a variable is undeclared
set -u

main() {
#   Deploy platform
    docker-compose -f docker-compose-production.yml down
}

if [[ "$0" == "${BASH_SOURCE[0]}" ]]; then
    main "$@"
fi