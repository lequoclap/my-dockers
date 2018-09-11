#!/bin/bash

REPO='laplq/flask-mecab-alpine'
TAG='3.8'

# build docker image

docker build --tag $REPO:$TAG .

# push docker image to hub

docker push $REPO
