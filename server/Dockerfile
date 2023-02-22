FROM python:3.11.2-slim

ARG TARGETPLATFORM

# On platform arm/v7, `gcc`, `libc6-dev`, and `libffi-dev` must be installed to
# be able to compile the `cffi` Python indirect dependency.
RUN if [ "$TARGETPLATFORM" = "linux/arm/v7" ]; then \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        gcc \
        libc6-dev \
        libffi-dev \
    && \
    apt-get clean \
    ; fi

ENV DEVPISERVER_SERVERDIR=/devpi/server
RUN mkdir -p $DEVPISERVER_SERVERDIR && \
    mkdir /entrypoint.d

COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "" ]

EXPOSE 3141
