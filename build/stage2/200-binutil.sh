#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
# shellcheck disable=SC1004
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/binutils-2.37.tar.xz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  xz --decompress binutils-2.37.tar.xz &&
  tar xfv binutils-2.37.tar &&
  cd binutils-2.37 &&
  mkdir build &&
  cd build &&
  ../configure                  \
    --prefix=/usr               \
    --host=${LFS_TARGET}        \
    --build=${LFS_HOST}         \
    --disable-nls               \
    --enable-shared             \
    --disable-werror            \
    --enable-64-bit-bfd &&
  make &&
  make DESTDIR=${LFS} install &&
  install -vm755 libctf/.libs/libctf.so.0.0.0 ${LFS}/usr/lib'