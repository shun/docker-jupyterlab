#!/bin/bash
export PATH=/home/$WORKUSER/.local/bin:$PATH
export LD_PRELOAD=/usr/lib/aarch64-linux-gnu/libGLdispatch.so.0:/home/jupyter/.local/lib/python3.8/site-packages/scikit_learn.libs/libgomp-d22c30c5.so.1.0.0

echo "[$@]"
exec "$@"
