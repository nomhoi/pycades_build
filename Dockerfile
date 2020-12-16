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

RUN set -ex; \
    cd /cprocsp; \
    tar xvf linux-amd64_deb.tgz; \
    ./linux-amd64_deb/install.sh; \
    apt-get install ./linux-amd64_deb/lsb-cprocsp-devel_5.0.11944-6_all.deb

RUN set -ex; \
    cd /cprocsp; \
    tar xvf cades_linux_amd64.tar.gz; \
    apt-get install ./cades_linux_amd64/cprocsp-pki-cades-64_2.0.14071-1_amd64.deb

RUN pip install pycryptoprosdk

RUN mkdir /code

WORKDIR /code
