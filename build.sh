#!/bin/sh
#
# build.sh
# pulls down the latest jenkinsci build, tweaks the dockerfile, then 
# runs the build and pushes to hub.docker.com
#

git clone https://github.com/jenksci/docker
