#!/bin/bash
# set -ev

TIMEOUT_ITERATION=5

sleep $1

for i in {1..5}; do
    STATUS=`docker exec -t jitterbit_test jitterbit status || true`
    echo "Checking service status ..."
    echo "${STATUS}"
    ASSERT=`echo "${STATUS}" | grep "All services are running" | wc -l`
    if [ "${ASSERT}" == 1 ]; then
        exit 0
    fi
    sleep ${TIMEOUT_ITERATION}
done

exit 1