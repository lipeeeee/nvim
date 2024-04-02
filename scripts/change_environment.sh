#!/bin/bash

# Check for environment name
if [ -z "$1" ]; then
  echo "No environment name supplied"
  exit
fi

# Change .environment file
echo $1 > .environment
