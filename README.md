Issue tracked at [traviscross/mtr #XXX]().

When using MTR inside a Docker container on MacOS, it's possible to have negative latency values.

The MTR command used is `mtr -4 -i 0.2 -c 20 --json google.com`.

Maybe this is related to the way Docker deals with the clock on MacOS: https://www.docker.com/blog/addressing-time-drift-in-docker-desktop-for-mac/

I thought the [PR #281](https://github.com/traviscross/mtr/pull/281/) about the monotonic clock would solve the issue but it's not working.

This repository is a reproducer of the issue. On a Mac (maybe other OS also), run `./run-with-docker.sh`. After a few MTR run (usually below 20 but sometimes much more), the Python script will fail because the Best latency is negative.
