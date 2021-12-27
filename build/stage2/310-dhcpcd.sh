#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/dhcpcd-9.4.1.tar.xz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  xz --decompress dhcpcd-9.4.1.tar.xz &&
  tar xf dhcpcd-9.4.1.tar &&
  cd dhcpcd-9.4.1 &&
  ./configure    \
    --host=${LFS_TARGET}                                    \
    --build=${LFS_HOST}                                     \
    --prefix=/usr                \
    --sysconfdir=/etc            \
    --libexecdir=/usr/lib/dhcpcd \
    --dbdir=/var/lib/dhcpcd      \
    --runstatedir=/run &&
  make &&
  make DESTDIR=${LFS} install'