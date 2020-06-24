#!/bin/bash

set -euo pipefail

docker build -t mtr-bug-negative-latency:latest .
docker run -it mtr-bug-negative-latency