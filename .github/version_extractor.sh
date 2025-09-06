#!/bin/bash
set -eo pipefail

################################################################################
#
# This script will try to extract the version of the package of interest from
# the file targeted.
#
# $1: The file to scan
# $2: String defining if it is the server or client we are looking at
#
################################################################################


version=$(sed -n -r -e 's/\s*devpi-'"${2}"'==([1-9]+\.[0-9]+\.[0-9]+).*$/\1/p' "${1}")

if [ -z "${version}" ]; then
    echo "Could not extract '${2}' version from '${1}'"
    exit 1
fi

echo "APP_MAJOR=$(echo ${version} | cut -d. -f 1)"
echo "APP_MINOR=$(echo ${version} | cut -d. -f 2)"
echo "APP_PATCH=$(echo ${version} | cut -d. -f 3)"
