#!/bin/sh
#
# build.sh
# pulls down the latest jenkinsci build, tweaks the dockerfile, then 
# runs the build and pushes to hub.docker.com
#

git clone https://github.com/jenkinsci/docker
cd docker
docker build -t wroney688/rpi-jenkins:latest -f Dockerfile .
docker build -t wroney688/rpi-jenkins:latest-alpine -f Dockerfile-alpine .
docker build -t wroney688/rpi-jenkins:latest-slim -f Dockerfile-slim .
