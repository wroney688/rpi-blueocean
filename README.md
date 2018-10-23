
Build of Jenkinsci for the Raspberry Pi

# Purpose
The official builds aren't ARCH targeting ARM, so this is a variation to build
the lts-alpine image on the PI and push it to hub.docker.com for use.  The only
thing required is to get the jenkinsci/docker project off github, rebuild
with the existing dockerfiles, and then push them to a repo.  

As of Oct 16, 2018, this pushes:
- wroney/rpi-jenkins:latest
- wroney/rpi-jenkins:latest-alpine
- wroney/rpi-jenkins:latest-slim
