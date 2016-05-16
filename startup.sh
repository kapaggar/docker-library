#!/bin/bash
DG=data-generator
docker run -d -v "${PWD}/logs":"/var/log/analytics/" -v "$PWD/${DG}/config1.sh":"/config.sh" --name datagen1 wizni/data-generator:v0.1 
docker run -d -v "${PWD}/logs":"/var/log/analytics/" -v "$PWD/${DG}/config2.sh":"/config.sh" --name datagen2 wizni/data-generator:v0.1 

ES=elasticsearch
docker run -d -v "$PWD/esdata":/usr/share/elasticsearch/data --name elasticsearch  -h  elasticsearch wizni/elasticsearch:v0.1

TDA=tdagent
docker run -d -v "${PWD}/logs":"/var/log/analytics/" -v "$PWD/${TDA}/fluent.conf":"/etc/fluentd/fluent.conf" --name "td-agent" --link elasticsearch wizni/td-agent:v0.1 

ZL=zeppelin
docker run -d -p 8080:8080 -p 8081:8081 --name "zeppelin" --link elasticsearch wizni/zeppelin:v0.1
