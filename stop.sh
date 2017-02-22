#!/bin/bash

# Safely stops Jitterbit proceses
docker exec \
    -t jitterbit \
    jitterbit stop

# Stops the container
docker stop jitterbit
