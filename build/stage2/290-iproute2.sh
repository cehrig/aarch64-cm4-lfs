#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/iproute2-5.14.0.tar.xz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  xz --decompress iproute2-5.14.0.tar.xz &&
  tar xf iproute2-5.14.0.tar &&
  cd iproute2-5.14.0 &&
  sed -i -e "s/ netem / /" Makefile &&
  make CC=${LFS_TARGET}-gcc LD=${LFS_TARGET}-ld &&
  make DESTDIR=${LFS} install'

