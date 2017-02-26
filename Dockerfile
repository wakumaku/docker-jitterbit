###############################################################################
# Jitterbit Data Loader Agent
# Version: 8.21.0.2
# Made at (bandit.io)
###############################################################################
FROM phusion/baseimage:0.9.19

###############################################################################
ENV INSTALL_DIR=/opt/install \
    INSTALL_FILE=jibberbit.deb \
    JITTERBIT_LINK=https://download.jitterbit.com/v8/agent/8.21/jitterbit-agent_8.21.0.2_i386.deb \
    JITTERBIT_HOME=/opt/jitterbit

ADD ${JITTERBIT_LINK} ${INSTALL_DIR}/${INSTALL_FILE}

# https://success.jitterbit.com/display/DOC/Download+and+Install+Harmony+Linux+Agent
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
        libc6:i386 \
        libgcc1:i386 \
        libstdc++6:i386 \
        libuuid1:i386 \
        zlib1g:i386 && \
    apt-get install -y \
        unixodbc \
        python \
        sed \
        sudo \
        unzip \
        tar

RUN groupadd -g 1000 jitterbit && \
    useradd -u 1000 -g jitterbit -m jitterbit && \
    echo '#!/bin/bash\n\
if [ ! -f ~/installation_done ]; then\n\
dpkg -i ${INSTALL_DIR}/${INSTALL_FILE}\n\
jitterbit-config \
    --user="${JB_USERNAME}" \
    --password="${JB_PASSWORD}" \
    --organization="${JB_ORGANIZATION}" \
    --agent-group="${JB_AGENT_GROUP}" \
    --agent="${JB_AGENT}" && \
jitterbit initdb && \
touch ~/installation_done\n\
rm ${JITTERBIT_HOME}/*.gz\n\
rm -rf ${INSTALL_DIR}\n\
fi\n\
jitterbit restart' \
>   /etc/my_init.d/00_startup.sh && \
    chmod +x /etc/my_init.d/00_startup.sh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 46914

CMD ["/sbin/my_init"]