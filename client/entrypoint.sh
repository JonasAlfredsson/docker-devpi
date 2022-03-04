#!/usr/bin/env sh
set -e

# Connect to the defined devpi server URL, or default to localhost.
devpi use "${DEVPI_URL:=http://localhost:3141/root/pypi}"

# If a user is defined we try to login with that.
if [ -n "${DEVPI_USER}" ]; then
  if [ -n "${DEVPI_PASSWORD}" ]; then
    devpi login --password "${DEVPI_PASSWORD}" "${DEVPI_USER}"
  else
    devpi login "${DEVPI_USER}"
  fi
fi

# Either just drop us into the shell, or execute whatever was given.
exec "$@"
