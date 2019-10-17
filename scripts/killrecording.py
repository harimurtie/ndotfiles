import psutil
import os
import signal

pids = psutil.get_pid_list()

for pid in pids:
    if (pid == <your_PID>):
    os.kill(pid,signal.SIGINT)

