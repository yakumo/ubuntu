FROM ubuntu:14.04

MAINTAINER yakumo

RUN apt-get update
RUN apt-get install -qy curl git make software-properties-common

# install go-lang
RUN add-apt-repository ppa:evarlast/golang1.4
RUN apt-get update
RUN apt-get install -qy golang-go

RUN mkdir -p /usr/local/go/bin
ENV GOPATH /usr/local/go
ENV GOBIN /usr/local/go/bin
ENV PATH $PATH:$GOBIN

# install java
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java8-installer
RUN update-java-alternatives -s java-8-oracle
RUN apt-get install oracle-java8-set-default

