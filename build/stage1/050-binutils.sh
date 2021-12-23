#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
# shellcheck disable=SC1004
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/binutils-2.37.tar.xz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  xz --decompress binutils-2.37.tar.xz &&
  tar xf binutils-2.37.tar &&
  cd binutils-2.37 &&
  mkdir build &&
  cd build &&
  ../configure                                \
   --prefix=${LFS_STAGE_1_CROSS_TOOLS}        \
   --target=${LFS_TARGET}                     \
   --disable-nls                              \
   --disable-multilib &&
   make configure-host &&
   make &&
   make install'