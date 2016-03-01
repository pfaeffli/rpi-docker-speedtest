rem Send the newest version to the server
start /WAIT docker build -t felixnext/speedtest:latest .
rem Run the version local
start /WAIT docker rm -f speedtest
start /WAIT docker run -d -p 4242:80 --name speedtest -v /c/Users/root9/Downloads/speed:/data felixnext/speedtest:latest
