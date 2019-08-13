FROM ubuntu:16.04

RUN apt-get update && apt-get install -y python-pip zlib1g-dev libbz2-dev liblzma-dev

RUN pip install cython numpy scipy 

RUN apt-get update && apt-get install -y zlib1g-dev libbz2-dev liblzma-dev

RUN pip install RGT==0.12.1
