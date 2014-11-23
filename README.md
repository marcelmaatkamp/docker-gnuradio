This is a Dockerfile for building GNURadio 3.7.1 and its modules:

- uhd (003.008.000-release)
- rtl-sdr
- hackrf
- gr-iqba
- bladeRF
- gr-osmosdr
- gr-baz
- gr-extras

----------
**BUILD**

To build an image with this file simply use:
    $ git clone https://github.com/marcelmaatkamp/docker-gnuradio.git
    $ cd docker-gnuradio 
    $ docker build -t marcelmaatkamp/gnuradio .

----------

**DEPLOY**

A pre-build image of this dockerfile can be found at https://registry.hub.docker.com/u/marcelmaatkamp/gnuradio
   
    $ docker pull marcelmaatkamp/gnuradio
    $ docker run -t -i --privileged -v /dev/bus/usb:/dev/bus/usb marcelmaatkamp/gnuradio /bin/bash
