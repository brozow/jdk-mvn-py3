#!/bin/bash 

# Reference: 
# - https://docs.docker.com/engine/userguide/containers/dockerimages/
# - https://github.com/dockerfile/java/blob/master/oracle-java8/Dockerfile

# example:
#  docker build -t openkbs/jre-mvn-py3:1.0.0 -t openkbs/jre-mvn-py3:latest .

imageTag=openkbs/jre-mvn-py3
#version=1.0.0

if [ ! "$version" == "" ]; then
    docker build -t ${imageTag}:$version -t ${imageTag}:latest .
    echo "---> To run in interactive mode: "
    echo "docker run --name <some-name> -it ${imageTag}:$version /bin/bash"
    echo "e.g."
    echo "docker run it ${imageTag}:$version "
    echo "docker run --name "my-$(basename $imageTag)" it ${imageTag}:$version "
else
    docker build -t ${imageTag} .
    echo "---> To run in interactive mode: "
    echo "docker run --name <some-name> -it ${imageTag} /bin/bash"
    echo "e.g."
    echo "docker run -it ${imageTag} "
    echo "docker run --name "my-$(basename $imageTag)" -it ${imageTag} "
fi

echo ">>> Docker Images"
echo "To build again: "
echo "  docker build -t ${imageTag} -t openkbs/${imageTag}:latest . "
echo
docker images 

