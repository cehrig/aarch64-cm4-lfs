#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
# shellcheck disable=SC1004
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/glibc-2.34.tar.xz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  xz --decompress glibc-2.34.tar.xz &&
  tar xf glibc-2.34.tar &&
  cd glibc-2.34 &&
  mkdir build &&
  cd build &&
  CC=${LFS_TARGET}-gcc ../configure        \
    --build=${LFS_HOST}                    \
    --host=${LFS_TARGET}                   \
    --target=${LFS_TARGET}                 \
    --prefix=/usr                          \
    --disable-multilib &&
  make &&
  make DESTDIR=${LFS} install'