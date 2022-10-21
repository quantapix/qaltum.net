#!/bin/bash
set -x -e -u -o pipefail

upgrade() {
    nvm install --lts
    npm install --location=global yarn
}

show_usage() {
    echo "Usage: $(basename "$0") [-u]"
}

main() {
    local OPTIND=1
    while getopts "h" opt; do
	      case $opt in
	          *) show_usage; return 1;;
	      esac
    done
    shift $((OPTIND-1))
    upgrade
}

main "$@"
