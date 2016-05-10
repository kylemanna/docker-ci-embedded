#
# Embedded ARM build environment for use with gitlab-ci-multi-runner
#
# Author: Kyle Manna <kyle[at]kylemanna[d0t]com>
#

#
# Ubuntu is selected due to its long support life.
#
FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y build-essential git cmake gcc clang python qemu-user \
                       curl libc6-i386 python-protobuf protobuf-compiler \
                       valgrind && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#
# Ubuntu 14.04 doesn't have arm-none-eabi-gcc and newlib with nano.specs.
# Instead, install upstream release manually (requires bloated libc6-i386)
#
# Delete unused documentation directory to keep the build lean
RUN curl -sSL https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2 \
    | tar xjf - --strip=1 -C /usr && \
    rm -rf /usr/share/doc/gcc-arm-none-eabi
