FROM ubuntu:14.04
 
MAINTAINER WIZE  <analytics-support@wizni.com>
LABEL Description="Wizni elasticsearch docker image" Vendor="Wizni Organization" Version="0.1"
 
ENV DEBIAN_FRONTEND=noninteractive
 
RUN apt-get update;\
    apt-get install -y --no-install-recommends software-properties-common && \
    add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    (echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections) && \
    apt-get install --no-install-recommends -y oracle-java8-installer && \
    rm -rf /var/cache/oracle-jdk8-installer && \
    echo "networkaddress.cache.ttl=60" >> /usr/lib/jvm/java-8-oracle/jre/lib/security/java.security && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
    
ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle
 
ENV GOSU_VERSION 1.7
RUN set -x \
        && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
        && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc" \
        && export GNUPGHOME="$(mktemp -d)" \
        && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
        && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
        && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
        && chmod +x /usr/local/bin/gosu \
        && gosu nobody true

# https://www.elastic.co/guide/en/elasticsearch/reference/current/setup-repositories.html
# https://packages.elasticsearch.org/GPG-KEY-elasticsearch
RUN apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 46095ACC8548582C1A2699A9D27D666CD88E42B4

ENV ELASTICSEARCH_MAJOR 2.3
ENV ELASTICSEARCH_VERSION 2.3.2
ENV ELASTICSEARCH_REPO_BASE http://packages.elasticsearch.org/elasticsearch/2.x/debian

RUN echo "deb $ELASTICSEARCH_REPO_BASE stable main" > /etc/apt/sources.list.d/elasticsearch.list

RUN set -x \
        && apt-get update \
        && apt-get install -y --no-install-recommends elasticsearch=$ELASTICSEARCH_VERSION \
        && rm -rf /var/lib/apt/lists/*

ENV PATH /usr/share/elasticsearch/bin:$PATH

WORKDIR /usr/share/elasticsearch

RUN set -ex \
        && for path in \
                ./data \
                ./logs \
                ./config \
                ./config/scripts \
        ; do \
                mkdir -p "$path"; \
                chown -R elasticsearch:elasticsearch "$path"; \
        done

COPY config ./config

VOLUME /usr/share/elasticsearch/data

COPY docker-entrypoint.sh /

EXPOSE 9200 9300
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["elasticsearch"]
