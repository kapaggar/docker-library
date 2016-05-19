FROM java:8-jre
RUN curl -L http://$(/sbin/ip route|awk '/default/ { print $3 }'):8000/zeppelin-0.6.0-incubating-SNAPSHOT.tar.gz | tar zxf -
EXPOSE 8080 8081
CMD zeppelin-0.6.0-incubating-SNAPSHOT/bin/zeppelin.sh stop && zeppelin-0.6.0-incubating-SNAPSHOT/bin/zeppelin.sh start
