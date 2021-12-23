#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/shadow-4.10.tar.gz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  tar xf shadow-4.10.tar.gz &&
  cd shadow-4.10 &&
  sed -i "s/groups\$(EXEEXT) //" src/Makefile.in &&
  find man -name Makefile.in -exec sed -i "s/groups\.1 / /"   {} \; &&
  find man -name Makefile.in -exec sed -i "s/getspnam\.3 / /" {} \; &&
  find man -name Makefile.in -exec sed -i "s/passwd\.5 / /"   {} \; &&
  sed -i -e "s@#ENCRYPT_METHOD DES@ENCRYPT_METHOD SHA512@" -e "s@/var/spool/mail@/var/mail@" etc/login.defs &&
  mkdir build &&
  cd build &&
  ../configure    \
    --host=${LFS_TARGET} \
    --build=${LFS_HOST} \
    --sysconfdir=/etc --with-group-name-max-length=32 &&
  make &&
  make DESTDIR=${LFS} install'

