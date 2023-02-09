FROM python:3.11.2

ENV DEVPISERVER_SERVERDIR=/devpi/server
RUN mkdir -p $DEVPISERVER_SERVERDIR && \
    mkdir /entrypoint.d

COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "" ]

EXPOSE 3141
