
Build of Jenkinsci for the Raspberry Pi

# Purpose
The official builds aren't ARCH targeting ARM, so this is a variation to build
the lts-alpine image on the PI and push it to hub.docker.com for use.  The only
thing required is to get the jenkinsci/docker project off github, rebuild
with the existing dockerfiles, and then push them to a repo.  

This repo, running build.sh, updates the jenkinsci/docker and then runs a build.  It generates images for all three flavors with -$ARCH in the tag:
- wroney/rpi-jenkins-$ARCH:latest
- wroney/rpi-jenkins-slim-$ARCH:latest
- wroney/rpi-jenkins-alpine-$ARCH:latest

On a 32 bit Pi environment, arch is arm7l, under 64 bit for a Pi3 the arch is aarch64.  Three manifest yamls are provided for use with [estesp/manifest-tool](https://github.com/estesp/manifest-tool).  This allows multi-arch manifesting for the two images as:
- wroney/rpi-jenkins:latest
- wroney/rpi-jenkins-slim:latest
- wroney/rpi-jenkins-alpine:latest
