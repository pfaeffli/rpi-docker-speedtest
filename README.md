# docker-speedtest
Small Docker, Node.js and Python Application that will test the connection speed in regular intervals. (Note: Also runs on the raspberry pi)

## Docker image

You can also directly pull the docker image from my docker repository:
https://hub.docker.com/r/felixnext/speedtest/ 

It should be started with a command like:
```bash
docker run -d -p 80:80 --name speedtest -v /tmp/speed:/data felixnext/speedtest:latest
```

## Run on the PI

The container can also run on the pi. To do so, change the first line of the docker file to use the `hypriot/rpi-node:slim` image. 

> Note, that the image can then not be compiled on a x86 machine, but you can compile it directly on the Pi.
