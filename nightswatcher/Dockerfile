FROM phusion/baseimage:0.9.22

RUN add-apt-repository -y ppa:openjdk-r/ppa
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        python-wheel python-setuptools build-essential python-dev python-pip \
        unzip zipalign zsync openjdk-8-jdk \
    && apt-get remove -y openjdk-7-jre-headless \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r requirements.txt && rm -rf /tmp/* /var/tmp/*
COPY ./nightswatcher.py /nightswatcher.py

CMD ["/usr/local/bin/gunicorn", "--access-logfile", "-", "-b", "0.0.0.0:9742", "-w", "1", "-k", "gevent", "nightswatcher:api"]
