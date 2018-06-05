# Use an official Python runtime as a parent image
FROM ubuntu:18.04

MAINTAINER lzutao "https://github.com/lzutao"

# Set the working directory to /root
WORKDIR /root

# Install packages for building ibus-unikey
RUN apt-get update
RUN apt-get install -y --force-yes build-essential git
RUN apt-get install -y --force-yes install libibus-1.0-dev libgtk2.0-dev meson
RUN apt-get clean

RUN git clone --depth 1 https://github.com/lzutao/ibus-unikey.git ibus-unikey
RUN cd ibus-unikey; meson builddir -Dprefix=/usr -Dlibexec=lib/ibus && ninja -C builddir install

# Run app.py when the container launches
CMD ["/usr/lib/ibus/ibus-setup-unikey"]
CMD ["/usr/lib/ibus/ibus-engine-unikey"]
