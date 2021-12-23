#!/bin/bash

# read step or run stage 1 and 2
VAR="${1:-ALL}"

# stop on error
set -e

# include functions
. common/functions.sh

# environment variables, always needed
. setup/envvar.sh

# general setup, cleanups
if [ "$VAR" = "ALL" ]; then
  read -s -n 1 -p "Press any key to start cleanup . . ."
  . setup/deps.sh
  . setup/cleanup.sh
fi

# stage 1
if [ "$VAR" = "ALL" ] || [ "$VAR" = "stage1" ]; then
  read -s -n 1 -p "Press any key to start stage 1 . . ."
  time . stage1.sh
fi

# stage 2
if [ "$VAR" = "ALL" ] || [ "$VAR" = "stage2" ]; then
  read -s -n 1 -p "Press any key to start stage 2 . . ."
  time . stage2.sh
fi

# package
if [ "$VAR" = "ALL" ] || [ "$VAR" = "package" ]; then
  read -s -n 1 -p "Press any key to start packaging process . . ."
  . package/essential_files.sh
  . package/tarball.sh
fi




