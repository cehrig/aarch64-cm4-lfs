#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/sysvinit-2.99.tar.xz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  xz --decompress sysvinit-2.99.tar.xz &&
  tar xf sysvinit-2.99.tar &&
  cd sysvinit-2.99 &&
  make -C src CC=${LFS_TARGET}-gcc &&
  cp src/{init,halt,shutdown,runlevel,killall5,fstab-decode,logsave,sulogin,bootlogd} ${LFS}/sbin/'

