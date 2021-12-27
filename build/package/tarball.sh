#!/bin/bash

tar vcfz "$LFS_HOME"/stage2.tar.gz --exclude 'stage1' --exclude 'usr/libexec/gcc/aarch64-unkonwn-linux-gnu' --exclude 'usr/bin/lto-dump'  -C "$LFS" . --owner=0 --group=0