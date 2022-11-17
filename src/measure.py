# repeatadly execute shell script
import time
import os
import subprocess
import sys
import re
import schedule

def measure():
    with open("/data/speeds.csv", "a") as f:
        try:
            p = subprocess.Popen(['speedtest-cli', '--simple'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            out, err = p.communicate()
            # parse output
            data = re.split(r'(: | [mM])', out)
            f.write(time.ctime() + ";" + data[2] + ";" + data[6] + ";" + data[10] + "\n")
        except:
            f.write(time.ctime() + ";0;0;0\n")
def run():
    schedule.every().day.at("06:00").do(measure)
    schedule.every().day.at("12:00").do(measure)
    schedule.every().day.at("18:00").do(measure)
    schedule.every().day.at("22:00").do(measure)
    schedule.every().day.at("01:00").do(measure)
    schedule.every().day.at("03:00").do(measure)

    while True:
        schedule.run_pending()
        time.sleep(1)

if __name__ == "__main__":
    run()
