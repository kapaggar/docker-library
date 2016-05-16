FROM java:8-jre
RUN curl -L http://192.168.162.241:8000/zeppelin-0.6.0-incubating-SNAPSHOT.tgz | tar zxf - ;\
    zeppelin-0.6.0-incubating-SNAPSHOT/bin/zeppelin-daemon.sh start
EXPOSE 8080 8081
CMD zeppelin-0.6.0-incubating-SNAPSHOT/bin/zeppelin.sh start && zeppelin-0.6.0-incubating-SNAPSHOT/bin/zeppelin.sh start
