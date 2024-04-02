#!/bin/bash

# Check for environment name
if [ -z "$1" ]; then
  echo "No environment name supplied"
  exit
fi

env_root=lua/$1

# Check if env already exists
if test -d $env_root; then
  echo "Environment already exists"
  exit
fi

# Environment root
mkdir $env_root
touch $env_root/post_load.lua
echo "-- This file runs after everything is loaded initially" > $env_root/post_load.lua

# Globals
mkdir $env_root/globals
touch $env_root/globals/init.lua
echo "-- Initializer for globals" > $env_root/globals/init.lua

# Preferences
mkdir $env_root/preferences
touch $env_root/preferences/options.lua
echo "-- :help options" > $env_root/preferences/options.lua
touch $env_root/preferences/autoexec.lua
touch $env_root/preferences/remaps.lua

# Plugins
mkdir $env_root/plugins
touch $env_root/plugins/sources.lua
echo "return {" > $env_root/plugins/sources.lua
echo "" >> $env_root/plugins/sources.lua
echo "}" >> $env_root/plugins/sources.lua
