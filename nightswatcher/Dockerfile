FROM phusion/baseimage:0.9.18

RUN add-apt-repository -y ppa:openjdk-r/ppa
RUN apt-get update
RUN apt-get install -y build-essential python-dev python-pip unzip
RUN apt-get install -y --no-install-recommends openjdk-8-jdk
RUN apt-get remove -y openjdk-7-jre-headless
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD ./requirements.txt /requirements.txt
RUN pip install -r requirements.txt
ADD ./nightswatcher.py /nightswatcher.py

CMD ["/usr/local/bin/gunicorn", "--access-logfile", "-", "-b", "0.0.0.0:9742", "-w", "1", "-k", "gevent", "nightswatcher:api"]
