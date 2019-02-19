FROM phusion/baseimage:0.10.2

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install --no-install-recommends -y \
        python-wheel python-setuptools build-essential python-dev python-pip \
        unzip zipalign zsync openjdk-8-jdk \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r requirements.txt && rm -rf /tmp/* /var/tmp/*
COPY ./nightswatcher.py /nightswatcher.py

RUN curl -L https://github.com/patrickfav/uber-apk-signer/releases/download/v1.0.0/uber-apk-signer-1.0.0.jar >/uber-apk-signer.jar

CMD ["/usr/local/bin/gunicorn", "--access-logfile", "-", "-b", "0.0.0.0:9742", "-w", "1", "-k", "gevent", "nightswatcher:api"]
