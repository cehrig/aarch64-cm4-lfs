#!/bin/bash

# download and build deps
apt-get install wget xz-utils build-essential

# linux headers deps
apt-get install rsync

# glibc deps
apt-get install libbison-dev gawk

# ldconfig deps - we will generate ld.so cache using qemu
apt-get install qemu-user-static

# raspberry pi kernel deps
apt-get install git