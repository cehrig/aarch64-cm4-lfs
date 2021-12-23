#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/procps-ng-3.3.17.tar.xz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  xz --decompress procps-ng-3.3.17.tar.xz &&
  tar xf procps-ng-3.3.17.tar &&
  cd procps-3.3.17 &&
  mkdir build &&
  cd build &&
  ac_cv_func_realloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes ../configure                                      \
    CFLAGS="-I${LFS}/usr/include"                   \
    LDFLAGS="-L${LFS}/usr/lib -L/home/lfs/stage1/cross-tools/lib/ "                      \
    --prefix=/usr                                   \
    --host=${LFS_TARGET}                            \
    --build=${LFS_HOST}                             \
    --docdir=/usr/share/doc/procps-ng-3.3.17        \
    --disable-static                                \
    --disable-kill &&
  make &&
  make DESTDIR=${LFS} install'