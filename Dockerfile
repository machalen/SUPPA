#########################################################################
#RNA-seq Tools
#Dockerfile to use SUPPA with python3
#Ubuntu 14.04
##########################################################################
#Build the image based on Ubuntu
FROM ubuntu:14.04

#Maintainer and author
MAINTAINER Magdalena Arnal <marnal@imim.es>

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  wget git unzip bzip2 g++ make zlib1g-dev ncurses-dev \
  default-jdk default-jre libncurses5-dev \
  libbz2-dev liblzma-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip
