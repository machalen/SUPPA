#########################################################################
#RNA-seq Tools
#Dockerfile to use SUPPA with python3
#Ubuntu 14.04
##########################################################################
#Build the image based on Ubuntu
FROM ubuntu:14.04

#Maintainer and author
MAINTAINER Magdalena Arnal <marnal@imim.es>

RUN apt-get update -y && apt-get install -y \
    wget git unzip bzip2 g++ make zlib1g-dev ncurses-dev default-jdk default-jre libncurses5-dev \
    libbz2-dev liblzma-dev
    
RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

#Set wokingDir in /bin
WORKDIR /bin
#Download required packages for python3
RUN pip3 install scipy==0.15.1 numpy==1.11.0
RUN pip3 install pandas statsmodels scikit-learn
#Download SUPPA
RUN wget https://github.com/comprna/SUPPA/archive/master.zip
#Unzip SUPPA
RUN unzip master.zip
#Clean
RUN rm master.zip
#Set wokingDir in /
WORKDIR /
