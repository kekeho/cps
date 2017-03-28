#!/usr/bin/env python3
# You should install this script @ /usr/local/bin/

import subprocess
import sys


help_txt = """Usage:
\tcps low :\tSet cpu frequency low (@ 800Mhz). CpuFan will be quiet.
\tcps max :\tSet cpu frequency max. there is no limmit.
\tcps [number] :\tSet cpu frequency [number]Ghz.
\tcps now :\tSee your cpu frequency at now
\tcps --help :\tTHIS IS IT (by Michael Jackson)"""


while True:
    try:
        argv = sys.argv[1]
        break
    except IndexError:
        print("ERROR: Missing argument.")
        exit()

if argv in "low":
    lowfreq = subprocess.getstatusoutput("cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_min_freq")
    hz = lowfreq[1].split("\n")[0]
    result = subprocess.getstatusoutput("sudo cpufreq-set -r -u "+hz)
elif argv in "max":
    maxfreq = subprocess.getstatusoutput("cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq")
    hz = maxfreq[1].split("\n")[0]
    result = subprocess.getstatusoutput("sudo cpufreq-set -r -u "+hz)
elif argv in "now":
    result = subprocess.getstatusoutput("cpufreq-info -m -f")
    print(result[1])
elif argv in "--help":
    print(help_txt)
    exit()
else:
    while True:
        try:
            result = subprocess.getstatusoutput(
                "sudo cpufreq-set -r -u {giga}Ghz".format(giga=float(argv)))
            break
        except ValueError:
            print("ERROR: ArgumentError")
            exit()


if result[0] == 0:
    pass
elif result[0] == 127:
    print("ERROR: Please install cpufreq like that.\nsudo apt-get install cpufreq")
elif result[0] == 218:
    print("ERROR: Wrong number")
else:
    print("ERROR")
