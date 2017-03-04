#!/bin/bash

if [ ! -f ~/installation_done ]; then
    echo "### Installing AGENT"
    dpkg -i ${INSTALL_DIR}/${INSTALL_FILE}
    echo "### Stopping AGENT"    
    jitterbit stop
    echo "### Configuring AGENT"    
    jitterbit-config \
        --user="${JB_USERNAME}" \
        --password="${JB_PASSWORD}" \
        --organization="${JB_ORGANIZATION}" \
        --agent-group="${JB_AGENT_GROUP}" \
        --agent="${JB_AGENT}"
    echo "### Initializing Database"        
    jitterbit initdb
    touch ~/installation_done
    rm ${JITTERBIT_HOME}/*.gz
    rm -rf ${INSTALL_DIR}
fi

echo "### Starting AGENT"    
jitterbit start