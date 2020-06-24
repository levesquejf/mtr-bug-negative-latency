import json
import subprocess

cnt = 0
while True:
    cnt += 1
    print(f"MTR #{cnt}")

    cmd = "/opt/app/mtr -4 -i 0.2 -c 20 --json google.com"
    proc = subprocess.Popen(
        cmd.split(" "), stdout=subprocess.PIPE, stderr=subprocess.STDOUT
    )
    stdout, _ = proc.communicate()

    data = json.loads(stdout)
    for hop in data["report"]["hubs"]:
        if hop["Best"] < 0:
            print(data)
            raise RuntimeError("ERROR! Negative Best!")
