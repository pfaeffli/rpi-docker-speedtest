# repeatadly execute shell script
import time
import os
import subprocess
import sys
import re

def measure():
    with open("/data/speeds.csv", "a") as f:
        try:
            p = subprocess.Popen(['/app/speedtest-cli', '--simple'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            out, err = p.communicate()
            # parse output
            data = re.split(r'(: | [mM])', out)
            f.write(time.ctime() + ";" + data[2] + ";" + data[6] + ";" + data[10] + "\n")
        except:
            f.write(time.ctime() + ";0;0;0\n")
def run():
    while True:
        measure()
        time.sleep(1800)

if __name__ == "__main__":
    run()
