FROM ubuntu:18.04

RUN apt-get update && apt-get install -y zlib1g-dev libbz2-dev liblzma-dev python-pip wget

RUN pip install cython numpy scipy 
RUN pip install RGT==0.12.1

RUN cd /root/rgtdata/

RUN python setupGenomicData.py --hg19 
RUN python setupGenomicData.py --mm10 
RUN python setupGenomicData.py --hg38
