## Jitterbit Data Loader Agent


* https://www.jitterbit.com
* http://info.jitterbit.com/Cloud-Data-Loader_Request-your-Free-Data-Loader.html

Standalone Jitterbit Data Loader Agent 

**Be aware that using the following instructions you are exposing your Jitterbit username/password on Dockerfiles nor the command line history**

---
# How to build:

Prepare a Dockerfile like this:

>FROM wakumaku/jitterbit:**8.17.0.2**
ENV JB_USERNAME your@email.tld
ENV JB_PASSWORD jitterbit_password
ENV JB_ORGANIZATION organization name
ENV JB_AGENTGROUP agent group name
ENV JB_AGENT agent name


Then, build it ...
>`docker build -t MyJitterbitImage .`

... and run it
>`docker run -d -t MyJitterbitImage`

---
# How to run:

>docker run -d \
    --env JB_USERNAME=your@email.tld \
    --env JB_PASSWORD=jitterbit_password \
    --env JB_ORGANIZATION=organization name \
    --env JB_AGENTGROUP=agent group name \
    --env JB_AGENT=agent name \
    -p 46914:46914 \
    -t wakumaku/jitterbit:**8.17.0.2**



---
# Tips&Tricks

Get the status:
`docker exec -t MyJitterbitContainer jitterbit status`

Where the logs are:
> /opt/jitterbit/logs

So, add `-v /your/absolute/logs/path:/opt/jitterbit/logs` on your `run` command to expose the logs


---
# ToDo:
* Prepare to connect external DB