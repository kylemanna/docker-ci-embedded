#
# Embedded ARM build environment for use with gitlab-ci-multi-runner
#
# Author: Kyle Manna <kyle[at]kylemanna[d0t]com>
#

FROM debian:testing

RUN apt-get update && \
    apt-get install -y build-essential git cmake gcc clang python qemu-user \
                       curl python-protobuf protobuf-compiler && \
                       gcc-arm-none-eabi && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
