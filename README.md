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

> Note, that the image can then not be compiled on a x86 machine, but you can compile it directly on the Pi.

The container can also run on the pi. To do so, change the first line of the docker file to use the `hypriot/rpi-node:slim` image. The Pi i tested on, run with the [hypriot image](http://blog.hypriot.com/downloads/). To install the system:

1. Copy the files on the pi (e.g. usb-stick)
2. Navigate to the folder where the `Dockerfile` lies and execute `docker build -t felixnext/speedtest:rpi .`
3. Create a new folder: `mkdir /tmp/speed`
4. Finally start the docker container using `docker run -d -p 80:80 --name speedtest -v /tmp/speed:/data felixnext/speedtest:latest`

The service should now be running on the pi and be available through the PI's ip address.
