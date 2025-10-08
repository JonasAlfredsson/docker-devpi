FROM python:3.14.0-slim

ENV DEVPISERVER_SERVERDIR=/devpi/server
RUN mkdir -p $DEVPISERVER_SERVERDIR && \
    mkdir /entrypoint.d

COPY requirements.txt /requirements.txt

# Do a single run command to make the intermediary containers smaller.
RUN set -ex && \
# Install packages necessary during the build phase (for all architectures).
    apt-get update && \
    apt-get install -y --no-install-recommends \
            build-essential \
            libffi8 \
            libffi-dev \
    && \
# Install Python dependencies.
    pip install --no-cache-dir -r /requirements.txt && \
# Remove everything that is no longer necessary.
    apt-get remove --purge -y \
            build-essential \
            libffi-dev \
    && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /root/.cache

COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "" ]

EXPOSE 3141
