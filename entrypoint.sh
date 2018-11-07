#!/bin/bash
set -e
echo "Starting Jupyter"
if [ -z "$1" ]; then
   jupyter-notebook --allow-root --ip=0.0.0.0 --port=8081
   else
   sh -c $1
fi
