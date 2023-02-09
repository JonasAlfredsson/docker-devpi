FROM python:3.11.2

ENV DEVPICLIENT_CLIENTDIR=/devpi/client
RUN mkdir -p $DEVPICLIENT_CLIENTDIR
WORKDIR $DEVPICLIENT_CLIENTDIR

COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "bash" ]
