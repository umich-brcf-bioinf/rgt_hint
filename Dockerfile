FROM ubuntu:18.04

RUN apt-get update && apt-get install -y zlib1g-dev libbz2-dev liblzma-dev libkrb5-3 python-pip gdebi wget locales texlive-font-utils
RUN locale-gen en_US.UTF-8

RUN pip install cython numpy scipy
RUN pip install RGT==0.12.1

RUN wget http://se.archive.ubuntu.com/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb
RUN gdebi -n libpng12-0_1.2.54-1ubuntu1_amd64.deb

ENV RGTDATA=/nfs/turbo/epicore-active/common/rgtdata
