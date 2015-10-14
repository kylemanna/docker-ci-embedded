FROM ubuntu:trusty

RUN echo 'deb http://ppa.launchpad.net/george-edison55/cmake-3.x/ubuntu trusty main' > /etc/apt/sources.list.d/cmake.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B118CD3C377DF930EDD06C67084ECFC5828AB726

RUN apt-get update && \
    apt-get install -y build-essential git cmake gcc clang python qemu-user curl libc6-i386 python-setuptools && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# arm-none-eabi-gcc and newlib in Ubuntu 14.04 don't have nano.specs,
# install manually.
RUN curl -L https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2 | tar xjf - --strip=1 -C /usr

RUN curl -L https://github.com/google/protobuf/releases/download/v3.0.0-beta-1/protobuf-python-3.0.0-alpha-4.tar.gz | tar xzf - && \
    cd protobuf-3.0.0-alpha-4 && \
    export MAKEFLAGS=-j$(grep processor /proc/cpuinfo | wc -l) && \
    ./configure --prefix=/usr && \
    make && \
    make install && \
    cd python && \
    python setup.py build && \
    python setup.py install
