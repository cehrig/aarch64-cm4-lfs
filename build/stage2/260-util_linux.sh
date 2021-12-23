#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/util-linux-2.37.2.tar.xz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  xz --decompress util-linux-2.37.2.tar.xz &&
  tar xf util-linux-2.37.2.tar &&
  cd util-linux-2.37.2 &&
  mkdir build &&
  cd build &&
  ../configure ADJTIME_PATH=/var/lib/hwclock/adjtime        \
    --host=${LFS_TARGET}                                    \
    --build=${LFS_HOST}                                     \
    --libdir=/usr/lib                                       \
    --docdir=/usr/share/doc/util-linux-2.37.2               \
    --disable-chfn-chsh                                     \
    --disable-login                                         \
    --disable-nologin                                       \
    --disable-su                                            \
    --disable-setpriv                                       \
    --disable-runuser                                       \
    --disable-pylibmount                                    \
    --disable-static                                        \
    --without-python                                        \
    --without-systemd                                       \
    --without-systemdsystemunitdir                          \
    --disable-makeinstall-chown                             \
    runstatedir=/run &&
  make &&
  make DESTDIR=${LFS} install'