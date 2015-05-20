docker-hadoop-amd64
===================

Hadoop is shipped with native libraries built under `x86`. This image builds Hadoop distribution for `amd64` arch.

## Get package

    docker run -ti --name hadoop-amd64 dbushev/hadoop-amd64:2.6.0 echo
    docker cp hadoop-amd64:/opt/hadoop-2.6.0.tar.gz /destination/path
