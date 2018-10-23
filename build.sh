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
docker build -t wroney/rpi-jenkins:latest -f Dockerfile .
echo -e "\033[1;36mBuilding latest-slim\033[0m"
docker build -t wroney/rpi-jenkins:latest-slim -f Dockerfile-slim .
echo -e "\033[1;36mBuilding latest-alpine\033[0m"
docker build -t wroney/rpi-jenkins:latest-alpine -f Dockerfile-alpine .

if [ "$ARCH" = "armhf" -o "$ARCH" = "armv7l" ]
then
        echo -e "\033[1;34mTagging for ARCH:armv7\033[0m"
        docker tag wroney/rpi-jenkins:latest wroney/rpi-jenkins-arm:latest
        docker tag wroney/rpi-jenkins:latest-slim wroney/rpi-jenkins-arm:latest-slim
        docker tag wroney/rpi-jenkins:latest-alpine wroney/rpi-jenkins-arm:latest-alpine
        echo -e "\033[1;34mPushing for ARCH:armv7\033[0m"
        docker push wroney/rpi-jenkins-arm:latest
        docker push wroney/rpi-jenkins-arm:latest-slim
        docker push wroney/rpi-jenkins-arm:latest-alpine
elif [ "$ARCH" = "aarch64" -o "$ARCH" = "arm64" ]
then
        echo -e "\033[1;34mTagging for ARCH:armv8\033[0m"
        docker tag wroney/rpi-jenkins:latest wroney/rpi-jenkins-arm64:latest
        docker tag wroney/rpi-jenkins:latest-slim wroney/rpi-jenkins-arm64:latest-slim
        docker tag wroney/rpi-jenkins:latest-alpine wroney/rpi-jenkins-arm64:latest-alpine
        docker tag wroney/rpi-jenkins:latest wroney/rpi-jenkins-aarch64:latest
        docker tag wroney/rpi-jenkins:latest-slim wroney/rpi-jenkins-aarch64:latest-slim
        docker tag wroney/rpi-jenkins:latest-alpine wroney/rpi-jenkins-aarch64:latest-alpine
        echo -e "\033[1;34mPushing for ARCH:armv7\033[0m"
        docker push wroney/rpi-jenkins-arm64:latest
        docker push wroney/rpi-jenkins-arm64:latest-slim
        docker push wroney/rpi-jenkins-arm64:latest-alpine
        docker push wroney/rpi-jenkins-aarch64:latest
        docker push wroney/rpi-jenkins-aarch64:latest-slim
        docker push wroney/rpi-jenkins-aarch64:latest-alpine
else
        echo -e "\033[1;34mUnknown architecture, bailing.\033[0m"
fi
