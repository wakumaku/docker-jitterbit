# Jitterbit Data Loader Agent


* https://www.jitterbit.com
* http://info.jitterbit.com/Cloud-Data-Loader_Request-your-Free-Data-Loader.html

Standalone Jitterbit Data Loader Agent

[![Build Status](https://travis-ci.org/wakumaku/docker-jitterbit.svg?branch=master)](https://travis-ci.org/wakumaku/docker-jitterbit)

Available Tags:
* v8.21.1.2
* v8.21.0.2
* v8.20.0.7
* v8.17.0.2

**Be aware that using the following instructions you will expose your Jitterbit username/password on Dockerfiles nor the command line history**

---
### How to build:

Prepare a Dockerfile like this:

```
FROM wakumaku/jitterbit:latest
ENV JB_USERNAME your@email.tld
ENV JB_PASSWORD jitterbit_password
ENV JB_ORGANIZATION organization name
ENV JB_AGENT_GROUP agent group name
ENV JB_AGENT agent name
```

Then, build it ...
```
docker build -t my_jitterbit_image .
```
... and run it
```
docker run -d -p 46914:46914 -t my_jitterbit_image
```

---
### How to run:

```
docker run -d \
    --env JB_USERNAME=your@email.tld \
    --env JB_PASSWORD=jitterbit_password \
    --env JB_ORGANIZATION=organization name \
    --env JB_AGENT_GROUP=agent group name \
    --env JB_AGENT=agent name \
    -p 46914:46914 \
    -t wakumaku/jitterbit:latest
```

[![asciicast](https://asciinema.org/a/105786.png)](https://asciinema.org/a/105786)


---
### Tips&Tricks

**Get the status:**
```
docker exec -t my_jitterbit_container jitterbit status
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
* Improve build/run tests