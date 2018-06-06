# Use an official Ubuntu as a parent image
FROM ubuntu:18.04

LABEL maintainer "lzutao https://github.com/lzutao/docker-ibus-unikey"

# Set the working directory to /root
WORKDIR /root

ENV DEBIAN_FRONTEND noninteractive

# Install packages for building ibus-unikey
RUN apt-get update -qq \
    && apt-get upgrade -qq \
    && apt-get install -qq g++ libibus-1.0-dev libgtk2.0-dev meson \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Run app.py when the container launches
#CMD ["echo", "hello world!"]
