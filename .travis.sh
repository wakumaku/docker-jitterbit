#!/bin/bash
set -ev

MAX_ITERATIONS=6
TIMEOUT_ITERARION=5

for i in {1..${MAX_ITERATIONS}}; do
    STATUS=`docker exec -t jitterbit_test jitterbit status`
    echo "Checking service status ..."
    echo "${STATUS}"
    ASSERT=`echo "${STATUS}" | grep "All services are running" | wc -l`
    if [ "${ASSERT}" == 1 ]; then
        exit 0
    fi
    sleep ${TIMEOUT_ITERARION}
done

exit 1