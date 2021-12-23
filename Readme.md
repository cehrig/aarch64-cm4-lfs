# RPi CM4 LFS environment
The repo build a aarch64 cross-compile toolchain (stage 1) and LFS environment (stage 2) to be run on a Raspberry Pi
Compute Module 4. This has been tested on a amd64 build machine.

# Setup

The build process is expected to run in a virtual Debian environment with inet connection. Do not run this on your host machine as it could break 
your operating system. It pulls in a couple of dependencies.
```
wget 
xz-utils 
build-essential 
rsync 
libbison-dev 
gawk
qemu-user-static
git
```

# Stage 1
Creates the cross-compile toolchain (binutils, kernel headers, GCC, glibc, libstdc++) we are using for building a limited
Linux environment.

`/bin/bash build.sh stage1`

# Stage 2
Creates our sysroot including all the relevant packages we expect in an embedded Linux environment

`/bin/bash build.sh stage2`

# Packaging
The packaging process currently creates a tarball including our new sysroot, that can be booted using a standard Rapsberry Pi 
kernel

`/bin/bash build.sh package`

Inspired by great tutorials

- [Linux From Scratch](https://www.linuxfromscratch.org/)
- [Cross Linux From Scratch](https://trac.clfs.org/)