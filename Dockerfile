FROM phusion/baseimage-docker:latest 

MAINTAINER m.maatkamp@gmail.com version: 0.1

RUN apt-get update
RUN apt-get dist-upgrade -yf
RUN apt-get clean
RUN apt-get autoremove

RUN apt-get install -y git subversion axel wget zip unzip 

# --- 
# GNURadio 
RUN wget http://www.sbrac.org/files/build-gnuradio && chmod a+x ./build-gnuradio && printf "y\ny\ny\n" | ./build-gnuradio
RUN "export PYTHONPATH=/usr/local/lib/python2.7/dist-packages" > ~/.bashrc

# ---
# MultiMode
RUN svn co https://www.cgran.org/svn/projects/multimode
RUN cd multimode/trunk && make install

# ---
# libosmocore.
RUN git clone git://git.osmocom.org/libosmocore.git 
RUN cd libosmocore && autoreconf –i && ./configure && make && make install && ldconfig

# ---
# Airprobe
# http://www.rtl-sdr.com/rtl-sdr-tutorial-analyzing-gsm-with-airprobe-and-wireshark/
# http://www.data.ks.uni-freiburg.de/download/comsysSS12/7.Lecture_2012-06-15/exercise06-Analyse.pdf

RUN git clone git://git.gnumonks.org/airprobe.git
RUN cd airprobe/gsmdecode && ./bootstrap && ./configure && make
RUN cd airprobe/gsm-receiver && ./bootstrap && ./configure && make

WORKDIR         /
# ENTRYPOINT      ["/bin/bash"]

