#!/bin/bash
set -e

if [ -z "$1" ]; then
   jupyter-notebook --allow-root --ip=0.0.0.0 --port=8082
   else "sh -c"
fi
