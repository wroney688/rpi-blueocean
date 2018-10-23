#!/bin/sh
#
# build.sh
# pulls down the latest jenkinsci build, tweaks the dockerfile, then 
# runs the build and pushes to hub.docker.com
#

git clone https://github.com/jenkinsci/docker
cd docker
docker build -t wroney/rpi-jenkins:`arch`-latest -f Dockerfile .
docker push wroney/rpi-jenkins:`arch`-latest
docker build -t wroney/rpi-jenkins:`arch`-latest-alpine -f Dockerfile-alpine .
docker push wroney/rpi-jenkins:`arch`-latest-alpine
docker build -t wroney/rpi-jenkins:`arch`-latest-slim -f Dockerfile-slim .
docker push wroney/rpi-jenkins:`arch`-latest-slim
