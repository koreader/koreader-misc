FROM phusion/baseimage:noble-1.0.2

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install --no-install-recommends -y \
        python3-wheel python3-setuptools build-essential python3-dev python3-pip \
        unzip zipalign zsync openjdk-8-jre-headless \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./requirements.txt /requirements.txt
RUN pip3 install --break-system-packages --no-cache-dir -r requirements.txt && rm -rf /tmp/* /var/tmp/*
COPY ./nightswatcher.py /nightswatcher.py

RUN curl -L https://github.com/patrickfav/uber-apk-signer/releases/download/v1.3.0/uber-apk-signer-1.3.0.jar >/uber-apk-signer.jar
RUN arch=$(uname -m) && \
    if [ "$arch" = "aarch64" ]; then \
        curl -L https://github.com/AppImageCommunity/AppImageUpdate/releases/download/2.0.0-alpha-1-20241225/appimageupdatetool-aarch64.AppImage >/tmp/appimageupdatetool.AppImage; \
    elif [ "$arch" = "x86_64" ]; then \
        curl -L https://github.com/AppImageCommunity/AppImageUpdate/releases/download/2.0.0-alpha-1-20241225/appimageupdatetool-x86_64.AppImage >/tmp/appimageupdatetool.AppImage; \
    else \
        echo "Unsupported architecture: $arch"; \
        exit 1; \
    fi && \
    chmod +x /tmp/appimageupdatetool.AppImage && \
    cd / && \
    /tmp/appimageupdatetool.AppImage --appimage-extract && \
    rm /tmp/appimageupdatetool.AppImage && \
    echo '#!/bin/sh\n./squashfs-root/AppRun "$@"' > /usr/local/bin/appimageupdatetool && \
    chmod +x /usr/local/bin/appimageupdatetool

CMD ["/usr/local/bin/gunicorn", "--access-logfile", "-", "-b", "0.0.0.0:9742", "-w", "1", "-k", "gevent", "nightswatcher:api"]
