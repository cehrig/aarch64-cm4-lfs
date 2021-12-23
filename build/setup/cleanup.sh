#!/bin/bash

# cleanup

if [ -d "$LFS_HOME" ]; then
  rm -rf "$LFS_HOME"
fi

if id "$LFS_USER" &>/dev/null; then
  userdel "$LFS_USER"
fi
