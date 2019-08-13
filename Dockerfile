FROM ubuntu:16.04

RUN apt-get update && apt-get install -y python-pip zlib1g-dev libbz2-dev liblzma-dev

RUN pip install cython numpy scipy 

RUN pip install RGT 
