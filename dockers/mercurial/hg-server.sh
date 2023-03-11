#!/bin/bash

if [ ! -d ./repos/.hg ]; then
    hg init ./repos
    cd ./repos
    echo "print('Hello, World!')" > test.py
    hg add test.py
    hg commit -u "Daniel Sobrado <daniel@danielsobrado.com>" -m "commit message"
fi

hg serve --daemon

while true; do sleep 2; done
