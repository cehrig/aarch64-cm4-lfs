#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
# shellcheck disable=SC1004
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/gzip-1.11.tar.xz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  xz --decompress gzip-1.11.tar.xz &&
  tar xfv gzip-1.11.tar &&
  cd gzip-1.11 &&
  mkdir build &&
  cd build &&
  ../configure --prefix=/usr        \
    --host=${LFS_TARGET} &&
  make &&
  make DESTDIR=${LFS} install'