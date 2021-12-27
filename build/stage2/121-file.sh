#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
# shellcheck disable=SC1004
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/file-5.41.tar.gz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  tar xfv file-5.41.tar.gz &&
  cd file-5.41 &&
  mkdir build &&
  cd build &&
  ../configure --prefix=/usr        \
    --build=${LFS_HOST}             \
    --host=${LFS_TARGET}            \
    --target=${LFS_TARGET} &&
  PATH=${LFS_STAGE_1_CROSS_TOOLS}/usr/bin:$PATH CFLAGS=-static make &&
  make DESTDIR=${LFS} install'