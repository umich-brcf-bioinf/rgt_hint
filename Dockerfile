FROM ubuntu:18.04

RUN apt-get update && apt-get install -y zlib1g-dev libbz2-dev liblzma-dev python-pip

RUN pip install cython numpy scipy 

RUN pip install RGT==0.12.1
