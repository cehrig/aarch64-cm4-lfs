#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
# shellcheck disable=SC1004
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/m4-1.4.19.tar.xz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  xz --decompress m4-1.4.19.tar.xz &&
  tar xf m4-1.4.19.tar &&
  cd m4-1.4.19 &&
  mkdir build &&
  cd build &&
  ../configure                  \
    --prefix=/usr               \
    --build=${LFS_HOST}         \
    --host=${LFS_TARGET} &&
    make &&                     \
    make DESTDIR=${LFS} install'