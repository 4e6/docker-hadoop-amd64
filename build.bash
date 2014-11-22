#!/usr/bin/env bash

set -e

# build protobuf
cd $PROTOBUF_SOURCES && ./configure && make

# build hadoop
export HADOOP_PROTOC_PATH=$PROTOBUF_SOURCES/src/protoc
cd $HADOOP_SOURCES && mvn package -Pdist,native -DskipTests -Dtar
mv $HADOOP_SOURCES/hadoop-dist/target/hadoop-2.5.2.tar.gz /opt/

# cleanup
cd $PROTOBUF_SOURCES && make clean
cd $HADOOP_SOURCES && mvn clean
rm -rf $HOME/.m2
