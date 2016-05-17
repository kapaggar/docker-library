#!/bin/bash
export DG=data-generator
docker run -d -v "${PWD}/logs":"/var/log/analytics/" -v "$PWD/${DG}/config1.sh":"/config.sh" --name datagen1 wizni/data-generator:v0.1 
docker run -d -v "${PWD}/logs":"/var/log/analytics/" -v "$PWD/${DG}/config2.sh":"/config.sh" --name datagen2 wizni/data-generator:v0.1 

export ES=elasticsearch
docker run -d -v "$PWD/esdata":/usr/share/elasticsearch/data --name elasticsearch  -h  elasticsearch wizni/elasticsearch:v0.1

export TDA=td-agent
docker run -d -v "${PWD}/logs":"/var/log/analytics/" -v "$PWD/${TDA}/td-agent.conf":"/etc/td-agent/td-agent.conf" --name "td-agent" --link elasticsearch wizni/td-agent:v0.1 

export ZL=zeppelin
docker run -d -p 8080:8080 -p 8081:8081 --name "zeppelin" --link elasticsearch wizni/zeppelin:v0.1
