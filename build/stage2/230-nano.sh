#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
# shellcheck disable=SC1004
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/nano-5.9.tar.gz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  tar xfv nano-5.9.tar.gz &&
  cd nano-5.9 &&
  mkdir build &&
  cd build &&
  ../configure                                     \
    CFLAGS="-I${LFS}/usr/include"                  \
    LDFLAGS="-L${LFS}/usr/lib"                     \
    --prefix=/usr                                  \
    --host=${LFS_TARGET}                           \
    --build=${LFS_HOST}  &&
  make &&
  make DESTDIR=${LFS} install'