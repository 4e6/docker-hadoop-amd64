FROM debian:sid
MAINTAINER Dmitry Bushev @4e6

# setup
RUN apt-get -q update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install build-essential maven cmake zlib1g-dev libssl-dev pkg-config openjdk-7-jre-headless openjdk-7-jdk curl

# build
RUN curl -Lk https://protobuf.googlecode.com/svn/rc/protobuf-2.5.0.tar.gz | tar -xz -C /opt
RUN curl -Lk http://www.eu.apache.org/dist/hadoop/common/hadoop-2.7.1/hadoop-2.7.1-src.tar.gz | tar -xz -C /opt

ENV PROTOBUF_SOURCES /opt/protobuf-2.5.0
ENV HADOOP_SOURCES /opt/hadoop-2.7.1-src

ADD build.bash /opt/
RUN /opt/build.bash
