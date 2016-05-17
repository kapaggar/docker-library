FROM ubuntu:14.04
MAINTAINER WIZE  <analytics-support@wizni.com>
LABEL Description="Wizni td-agentd docker image" Vendor="Wizni Organization" Version="1.0"
 
# environment
ENV DEBIAN_FRONTEND=noninteractive
 
# update
RUN apt-get update && \
    apt-get -y install curl libcurl4-openssl-dev ruby ruby-dev make && \
    curl -o td-agent.install.sh http://toolbelt.treasuredata.com/sh/install-ubuntu-trusty-td-agent2.sh && \
    /bin/sh td-agent.install.sh && \
    apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# install fluentd plugins
RUN /opt/td-agent/embedded/bin/fluent-gem install --no-ri --no-rdoc \
    fluent-plugin-elasticsearch \
    fluent-plugin-record-modifier \
    fluent-plugin-exclude-filter
 
 
# add conf
ADD ./etc/fluentd /etc/fluentd
 
#CMD /etc/init.d/td-agent stop && /opt/td-agent/embedded/bin/fluentd -c /etc/fluentd/fluent.conf
CMD /etc/init.d/td-agent stop && /usr/sbin/td-agent -c /etc/td-agent/td-agent.conf
