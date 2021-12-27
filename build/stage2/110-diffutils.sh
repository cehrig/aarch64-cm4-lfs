#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
# shellcheck disable=SC1004
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/diffutils-3.8.tar.xz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  xz --decompress diffutils-3.8.tar.xz &&
  tar xfv diffutils-3.8.tar &&
  cd diffutils-3.8 &&
  mkdir build &&
  cd build &&
  ../configure --prefix=/usr        \
    --build=${LFS_HOST}             \
    --host=${LFS_TARGET} &&
  make &&
  make DESTDIR=${LFS} install'