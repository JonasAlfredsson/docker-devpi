#!/bin/sh
set -e

# Execute any potential shell scripts in the entrypoint.d/ folder.
find "/entrypoint.d/" -follow -type f -print | sort -V | while read -r f; do
    case "${f}" in
        *.sh)
            if [ -x "${f}" ]; then
                echo "$(date '+%Y-%m-%d %H:%M:%S,000') INFO [entrypoint] Launching ${f}";
                "${f}"
            else
                echo "$(date '+%Y-%m-%d %H:%M:%S,000') INFO [entrypoint] Ignoring ${f}, not executable";
            fi
            ;;
        *)
            echo "$(date '+%Y-%m-%d %H:%M:%S,000') INFO [entrypoint] Ignoring ${f}";;
    esac
done

# Initialize devpi if there is no indication of it being run before.
if [ ! -f "${DEVPISERVER_SERVERDIR}/.serverversion" ]; then
    if [ -z "${DEVPI_PASSWORD}" ]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S,000') ERROR [entrypoint] Root password cannot be empty"
        exit 1
    fi
    devpi-init --root-passwd "${DEVPI_PASSWORD}"
fi

# Launch the server as the main process.
# Latest version will block correctly and listens to Ctrl+C.
devpi-server \
    --host 0.0.0.0 \
    --port 3141 \
    --restrict-modify=root \
    $@
