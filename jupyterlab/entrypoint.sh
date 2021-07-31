#!/bin/bash
export PATH=/home/$WORKUSER/.local/bin:$PATH
export LD_PRELOAD=/usr/lib/aarch64-linux-gnu/libGLdispatch.so.0

echo "[$@]"
exec "$@"
