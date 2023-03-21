#!/bin/bash

# Change ownership of the /repos directory
chown -R hguser:hguser /repos

if [ ! -d ./.hg ]; then
    # Run Mercurial commands as the hguser user
    sudo -u hguser hg init .
    sudo -u hguser echo "print('Hello, World!')" > test.py
    sudo -u hguser hg add test.py
    sudo -u hguser hg commit -u "Daniel Sobrado <daniel@danielsobrado.com>" -m "commit message"
fi

hg serve --daemon

while true; do sleep 2; done
