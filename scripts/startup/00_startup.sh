#!/bin/bash

if [ ! -f ~/installation_done ]; then
    dpkg -i ${INSTALL_DIR}/${INSTALL_FILE}
    jitterbit-config \
        --user="${JB_USERNAME}" \
        --password="${JB_PASSWORD}" \
        --organization="${JB_ORGANIZATION}" \
        --agent-group="${JB_AGENT_GROUP}" \
        --agent="${JB_AGENT}"
    jitterbit initdb
    touch ~/installation_done
    rm ${JITTERBIT_HOME}/*.gz
    rm -rf ${INSTALL_DIR}
fi

jitterbit restart