FROM python:3.8

ENV PIP_NO_CACHE_DIR=off \
  PYTHONUNBUFFERED=1 \
  TZ=Europe/Moscow

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        cmake \
        build-essential \
        libboost-all-dev \
        python3-dev \
        unzip; \
    rm -rf /var/lib/apt/lists/*

COPY ./cprocsp /cprocsp

RUN cd /cprocsp; \
    tar xvf linux-amd64_deb.tgz; \
    ./linux-amd64_deb/install.sh; \
    apt-get install ./linux-amd64_deb/lsb-cprocsp-devel_5.0.11944-6_all.deb

RUN cd /cprocsp; \
    tar xvf cades_linux_amd64.tar.gz; \
    apt-get install ./cades_linux_amd64/cprocsp-pki-cades-64_2.0.14071-1_amd64.deb

RUN set -ex; \
    cd /cprocsp; \
    unzip pycades.zip;

COPY CMakeLists.txt /cprocsp/pycades_0.1.19995/CMakeLists.txt

RUN set -ex; \
    cd /cprocsp/pycades_0.1.19995; \
    mkdir build; \
    cd build; \
    cmake ..; \
    make -j4

RUN set -ex; \
    cp /cprocsp/pycades_0.1.19995/pycades.so /usr/local/lib/python3.8/pycades.so

RUN mkdir /code

WORKDIR /code
