#!/bin/sh
apk update
apk add mercurial
if [ ! -d /var/hg/repos/.hg ]; then
    hg init /var/hg/repos
    cd /var/hg/repos
    echo "print('Hello, World!')" > test.py
    hg add test.py
    hg commit -m "Initial commit"
fi
hg serve --daemon
while true; do
    sleep 1
done
