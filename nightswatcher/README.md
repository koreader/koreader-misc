nightswatcher
=============

The new nightly build script for KOReader


Usage
-----

First, you need to setup a pipeline service hook token and trigger token in
gitlab. The webhook needs to be pointed at
`http://YOURDOMAIN:9742/webhooks/gitlab-pipeline`.

Then spin up the service with the following docker command:

```bash
docker run \
        --name nightswatcher \
        -v `pwd`/download:/data/release_download \
        -p 9742:9742 \
        -e GITLAB_TRIGGER_TOKEN='foo' \
        -e GITLAB_WEBHOOK_TOKEN='bar' \
        -d houqp/nightswatcher:0.1.1
```

All builds will be saved into download directory.
