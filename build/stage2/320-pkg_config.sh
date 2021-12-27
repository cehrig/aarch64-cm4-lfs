#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/pkg-config-0.29.2.tar.gz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  tar xf pkg-config-0.29.2.tar.gz &&
  cd pkg-config-0.29.2 &&
  mkdir build &&
  cd build &&
  echo "glib_cv_long_long_format=ll
        glib_cv_stack_grows=no
        ac_cv_func_posix_getpwuid_r=yes
        ac_cv_func_posix_getgrgid_r=yes
        glib_cv_uscore=yes" > arch.cache &&
  chmod a-w arch.cache &&
  ../configure  \
    --cache-file=arch.cache        \
    --host=${LFS_TARGET}                                        \
    --build=${LFS_HOST} \
    --prefix=/usr                          \
    --with-internal-glib                   \
    --disable-host-tool                    \
    --docdir=/usr/share/doc/pkg-config-0.29.2 &&
  make &&
  make DESTDIR=${LFS} install'