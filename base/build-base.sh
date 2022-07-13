#!/bin/sh
docker build --no-cache -t kihara/across-base:latest ./base
docker tag kihara/across-base:latest kihara/across-base:v20
docker compose build --no-cache
