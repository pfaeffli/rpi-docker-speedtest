rem create the docker images
start /WAIT docker build -t felixnext/speedtest:rpi .

rem push them
start /WAIT docker push felixnext/speedtest:rpi
