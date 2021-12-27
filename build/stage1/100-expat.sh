#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
# shellcheck disable=SC1004
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/expat-2.4.1.tar.bz2 ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  tar xf expat-2.4.1.tar.bz2 &&
  cd expat-2.4.1 &&
  mkdir build &&
  cd build &&
  ../configure \
    --prefix=${LFS_STAGE_1_CROSS_TOOLS}    \
    --build=${LFS_HOST}                                                    \
    --host=${LFS_TARGET}                                                   \
    --disable-static \
   make &&
   make install'