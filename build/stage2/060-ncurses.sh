#!/bin/bash

cleanup_work

# shellcheck disable=SC2016
# shellcheck disable=SC1004
as_lfs 'cp ${LFS_STAGE_1_SOURCES}/ncurses-6.2.tar.gz ${LFS_STAGE_1_WORK} &&
  cd ${LFS_STAGE_1_WORK} &&
  tar xfv ncurses-6.2.tar.gz &&
  cd ncurses-6.2 &&
  mkdir build &&
  cd build &&
  ../configure                          \
    --prefix=/usr                       \
    --build=${LFS_HOST}                 \
    --host=${LFS_TARGET}                \
    --target=${LFS_TARGET}              \
    --mandir=/usr/share/man             \
    --with-manpage-format=normal        \
    --with-shared                       \
    --without-debug                     \
    --without-ada                       \
    --without-normal                    \
    --enable-widec                      \
    --disable-stripping                 \
    --program-prefix= &&
  make &&
  make DESTDIR=${LFS} install &&
# we need the next line for nano
  ln -sf libncursesw.so.6 ${LFS}/usr/lib/libncurses.so'