FROM ubuntu:16.04

RUN apt-get update && \
  apt-get -y upgrade && \
  apt-get -y install  wget  unzip python2.7

RUN ln -s /usr/bin/python2.7 /usr/bin/python

RUN wget https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz
RUN tar xzvf go1.7.3.linux-amd64.tar.gz
RUN rm go1.7.3.linux-amd64.tar.gz

ENV PATH /go/bin:/usr/local/go:$PATH
ENV GOPATH /go


RUN wget https://storage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_linux_amd64-1.9.46.zip
RUN unzip go_appengine_sdk_linux_amd64-1.9.46.zip
RUN rm go_appengine_sdk_linux_amd64-1.9.46.zip

ENV PATH=$PATH:/go_appengine/
