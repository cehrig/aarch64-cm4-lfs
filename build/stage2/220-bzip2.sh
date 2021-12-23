#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
# shellcheck disable=SC1004
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/bzip2-1.0.8.tar.gz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  tar xfv bzip2-1.0.8.tar.gz &&
  cd bzip2-1.0.8 &&
  cp Makefile{,.orig} &&
  sed -e "/^all:/s/ test//" Makefile.orig > Makefile &&
  sed -i -e "s:ln -s -f $(PREFIX)/bin/:ln -s :" Makefile &&
  make -f Makefile-libbz2_so CC="${LFS_TARGET}-gcc" AR="${LFS_TARGET}-ar" RANLIB="${LFS_TARGET}-ranlib" &&
  make clean &&
  make CC="${LFS_TARGET}-gcc" AR="${LFS_TARGET}-ar" RANLIB="${LFS_TARGET}-ranlib" &&
  make PREFIX=${LFS}/usr install &&
  cp -v bzip2-shared ${LFS}/bin/bzip2 &&
  cp -av libbz2.so* ${LFS}/lib &&
  ln -sfv ../../lib/libbz2.so.1.0 ${LFS}/usr/lib/libbz2.so'