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
  CC=${LFS_TARGET}-gcc ../configure                                        \
    --build=${LFS_HOST}                                                    \
    --host=${LFS_TARGET}                                                   \
    --target=${LFS_TARGET}                                                 \
    --prefix=${LFS_STAGE_1_CROSS_TOOLS}/${LFS_TARGET}                      \
    --with-headers=${LFS_STAGE_1_CROSS_TOOLS}/${LFS_TARGET}/include        \
    --disable-multilib                                                     \
    libc_cv_forced_unwind=yes &&                                           \
  make install-bootstrap-headers=yes install-headers &&
  make &&
  make install &&
  ${LFS_STAGE_1_CROSS_TOOLS}/libexec/gcc/${LFS_TARGET}/11.2.0/install-tools/mkheaders'