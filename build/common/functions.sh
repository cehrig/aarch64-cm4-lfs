#!/bin/bash

cleanup_work() {
  as_lfs 'rm -rf $LFS_STAGE_1_WORK/*'
}

as_lfs() {
  set -x

  command="$@"
  su -l -c "set -e && printenv && $command && set +e" lfs

  set +x
}