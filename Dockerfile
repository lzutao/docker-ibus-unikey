# Use an official Python runtime as a parent image
FROM ubuntu:18.04

MAINTAINER lzutao "https://github.com/lzutao"

# Set the working directory to /root
WORKDIR /root

# Install packages for building ibus-unikey
RUN apt-get update -qq
RUN apt-get upgrade -qq
RUN apt-get install -qq build-essential git
RUN apt-get install -qq libibus-1.0-dev libgtk2.0-dev meson
RUN apt-get clean

# Run app.py when the container launches
#CMD ["echo", "hello world!"]
