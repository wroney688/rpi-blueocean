#!/bin/sh
#
# build.sh
# pulls down the latest jenkinsci build, tweaks the dockerfile, then 
# runs the build and pushes to hub.docker.com
#

ARCH=`arch`
echo -e "\033[1;35mPlatform is $ARCH\033[0m"
if [ -d docker ]
then
        echo -e "\033[1;36mUpdating jenkinsci/docker\033[0m"
        cd docker
        git pull origin
else
        echo -e "\033[1;36mRetrieving jenkinsci/docker\033[0m"
        git clone https://github.com/jenksci/docker
        cd docker
fi
echo -e "\033[1;36mBuilding latest\033[0m"
docker build -t wroney/rpi-jenkins-$ARCH:latest -f Dockerfile .
docker push wroney/rpi-jenkins-$ARCH:latest
echo -e "\033[1;36mBuilding latest-slim\033[0m"
docker build -t wroney/rpi-jenkins-$ARCH:latest-slim -f Dockerfile-slim .
docker push wroney/rpi-jenkins-$ARCH:latest-slim
echo -e "\033[1;36mBuilding latest-alpine\033[0m"
docker build -t wroney/rpi-jenkins-$ARCH:latest-alpine -f Dockerfile-alpine .
docker push wroney/rpi-jenkins-$ARCH:latest-alpine

