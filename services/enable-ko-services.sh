#!/bin/sh

sudo systemctl enable kosync
sudo systemctl enable nginx
sudo systemctl enable nightswatcher
sudo systemctl enable --now purge-old-artifacts.timer
sudo systemctl start purge-old-artifacts.service
echo 'Next purge-old-artifacts run'
systemctl list-timers | grep purge-old-artifacts
