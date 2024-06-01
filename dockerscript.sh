#!/bin/sh

docker build --no-cache -t  dalitest1 .
docker run --hostname "test" -it dalitest1:latest