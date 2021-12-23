#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
# shellcheck disable=SC1004
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/zlib-1.2.11.tar.xz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  xz --decompress zlib-1.2.11.tar.xz &&
  tar xfv zlib-1.2.11.tar &&
  cd zlib-1.2.11 &&
  mkdir build &&
  cd build &&
  CC=${LFS_TARGET}-gcc ../configure        \
    --prefix=/usr &&
  make &&
  make DESTDIR=${LFS} install'