FROM phusion/baseimage:focal-1.0.0

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install --no-install-recommends -y \
        python3-wheel python3-setuptools build-essential python3-dev python3-pip \
        unzip zipalign zsync openjdk-8-jre-headless \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./requirements.txt /requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt && rm -rf /tmp/* /var/tmp/*
COPY ./nightswatcher.py /nightswatcher.py

RUN curl -L https://github.com/patrickfav/uber-apk-signer/releases/download/v1.2.1/uber-apk-signer-1.2.1.jar >/uber-apk-signer.jar

CMD ["/usr/local/bin/gunicorn", "--access-logfile", "-", "-b", "0.0.0.0:9742", "-w", "1", "-k", "gevent", "nightswatcher:api"]
