FROM ubuntu:bionic
RUN \
        apt-get update && \
        apt-get install -y \
                build-essential autoconf automake libtool pkg-config libcurl4-gnutls-dev \
                libjansson-dev uthash-dev libncursesw5-dev libudev-dev libusb-1.0-0-dev \
                libevent-dev libmicrohttpd-dev libhidapi-dev
RUN \
        apt-get install -y git vim htop

WORKDIR /app
COPY . /app
RUN ./autogen.sh
RUN ./configure --enable-keccak --disable-sha256d --enable-cpumining --disable-other-drivers
RUN make

CMD sh ./mine-tesseract.sh

