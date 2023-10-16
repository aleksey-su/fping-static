FROM ubuntu:jammy

RUN apt update && apt install -y build-essential git autoconf

RUN mkdir -p /build 
RUN git clone  -b v5.1 --single-branch --depth=1  https://github.com/schweikert/fping.git /build/src
RUN cd /build/src \
    && autoreconf -i \
    && ./configure LDFLAGS="-static" --prefix=/opt/fping-static \
    && make -j4 \
    && make install -j4
