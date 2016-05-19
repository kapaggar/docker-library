FROM java:openjdk-7-jdk
MAINTAINER WIZE  <analytics-support@wizni.com>
LABEL Description="Wizni docker for maven compiler for zeppelin" Vendor="Wizni Organization" Version="1.0"

ENV MAVEN_VERSION 3.3.3

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get -y install curl npm libfontconfig \
  && update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10 \
  && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN mkdir -p /usr/share/maven \
  && curl -fsSL http://www.eu.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
  | tar -xzf - -C /usr/local/ \
  && ln -sf /usr/local/apache-maven-$MAVEN_VERSION/bin/mvn /usr/local/bin/mvn  

ENV MAVEN_HOME /usr/local/
WORKDIR /incubator-zeppelin
CMD ["mvn","package","-DskipTests","-Pbuild-distr"]
