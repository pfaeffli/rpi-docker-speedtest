#FROM hypriot/rpi-node:slim
FROM node:19-buster-slim

RUN mkdir /app

# expose volume
VOLUME /data

# setup external volume for script
RUN apt-get update \
    && apt-get install -y python python-pip git \
    && rm -rf /var/lib/apt/lists/* 

RUN pip install git+https://github.com/sivel/speedtest-cli.git schedule;\
    touch /data/speeds.csv ;\
    speedtest-cli -h ;

# set the working dear to the app
WORKDIR /app
# install node packages / copy all source files
COPY package.json /app/package.json
COPY src/ /app/
RUN cd /app && npm install

# setup script
# RUN python /app/measure.py

# expose port for server
EXPOSE 80
# start the server as entry point
CMD ["/bin/bash", "start.sh"]
#ENTRYPOINT ["python", "measure.py"]
