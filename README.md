
Build of Jenkinsci for the Raspberry Pi

# Purpose
The official builds aren't ARCH targeting ARM, so this is a variation to build
the lts-alpine image on the PI and push it to hub.docker.com for use.  The only
thing required is to get the jenkinsci/docker project off github, rebuild
with the existing dockerfiles, and then push them to a repo.  

Slight modifications are necessary to the Dockerfiles off jenkinsci/docker.  Jenkins will fail to startup because the base images generate errors on startup due to omitting ld-linux-aarch64.so.1.  Therefore, the build.sh does modify to add glibc.  This is only being done to Dockerfile-alpine since only the alpine version is being used by me.  If this is necessary for the full/slim images, feel free to fork.  I may get around to checking those later.

This repo, running build.sh, updates the jenkinsci/docker and then runs a build.  It generates images for all three flavors with -$ARCH in the tag:
- wroney/rpi-jenkins-$ARCH:latest
- wroney/rpi-jenkins-slim-$ARCH:latest
- wroney/rpi-jenkins-alpine-$ARCH:latest

On a 32 bit Pi environment, arch is arm7l, under 64 bit for a Pi3 the arch is aarch64.  Three manifest yamls are provided for use with [estesp/manifest-tool](https://github.com/estesp/manifest-tool).  This allows multi-arch manifesting for the two images as:
- wroney/rpi-jenkins:latest
- wroney/rpi-jenkins-slim:latest
- wroney/rpi-jenkins-alpine:latest

>./manifest-tool push from-spec manifest.yaml

>./manifest-tool push from-spec manifest-alpine.yaml

>./manifest-tool push from-spec manifest-slim.yaml
