This is a Dockerfile for building Gnuradio (HEAD)

To build an image with this file simply use:
 $ docker build -t marcelmaatkamp/gnuradio .

A pre-build image of this dockerfile can be found at:
 https://registry.hub.docker.com/u/marcelmaatkamp/gnuradio
 
To pull that image:
 $ docker pull marcelmaatkamp/gnuradio

Insert a RTLSDR dongle or any other supported hardware like 
a HackRF or USRP and issue the following command:

 $ docker run -t -i --privileged -v /dev/bus/usb:/dev/bus/usb marcelmaatkamp/gnuradio /bin/bash
 
See https://registry.hub.docker.com/u/marcelmaatkamp/gnuradio
