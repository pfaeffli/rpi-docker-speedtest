# MAKEFILE speedtest
#
# Simplify building and starting of docker speedtest
#
.PHONY: list
list:
	@LC_ALL=C $(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/(^|\n)# Files(\n|$$)/,/(^|\n)# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

build:
	docker build -t smarthome/speedtest .

run:
	docker run -d -p 9000:80 --name speedtest --restart unless-stopped -v $(PWD)/data:/data smarthome/speedtest:latest

stop:
	docker stop speedtest && docker rm speedtest
