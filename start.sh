#!/bin/bash

# Starts the container
docker start jitterbit

# Starts the service
docker exec \
    -t jitterbit \
    jitterbit start
