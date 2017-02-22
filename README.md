# Jitterbit Data Loader Agent


* https://www.jitterbit.com
* http://info.jitterbit.com/Cloud-Data-Loader_Request-your-Free-Data-Loader.html

[![Build Status](https://travis-ci.org/wakumaku/docker-jitterbit.svg?branch=master)](https://travis-ci.org/wakumaku/docker-jitterbit)

Standalone Jitterbit Data Loader Agent 

**Be aware that using the following instructions you are exposing your Jitterbit username/password on Dockerfiles nor the command line history**

---
### How to build:

Prepare a Dockerfile like this:

```
FROM wakumaku/jitterbit:latest
ENV JB_USERNAME your@email.tld
ENV JB_PASSWORD jitterbit_password
ENV JB_ORGANIZATION organization name
ENV JB_AGENTGROUP agent group name
ENV JB_AGENT agent name
```

Then, build it ...
```
docker build -t MyJitterbitImage .
```
... and run it
```
docker run -d -p 46914:46914 -t MyJitterbitImage
```

---
### How to run:

```
docker run -d \
    --env JB_USERNAME=your@email.tld \
    --env JB_PASSWORD=jitterbit_password \
    --env JB_ORGANIZATION=organization name \
    --env JB_AGENTGROUP=agent group name \
    --env JB_AGENT=agent name \
    -p 46914:46914 \
    -t wakumaku/jitterbit:latest
```


---
### Tips&Tricks

**Get the status:**
```
docker exec -t MyJitterbitContainer jitterbit status
```

**Logs:**
```
/opt/jitterbit/logs
```

So, add `-v /your/absolute/logs/path:/opt/jitterbit/logs` on your `run` command to expose the logs


---
### ToDo:
* Prepare to connect external DB
* Improve installation bash scripts
* Improve build/run test