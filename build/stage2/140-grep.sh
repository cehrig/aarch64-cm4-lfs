#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
# shellcheck disable=SC1004
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/grep-3.7.tar.xz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  xz --decompress grep-3.7.tar.xz &&
  tar xfv grep-3.7.tar &&
  cd grep-3.7 &&
  mkdir build &&
  cd build &&
  ../configure --prefix=/usr        \
    --host=${LFS_TARGET}            \
    --build=${LFS_HOST} &&
  make &&
  make DESTDIR=${LFS} install'