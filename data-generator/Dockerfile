FROM java:8-jre
COPY datagenerator.jar datagenerator-entrypoint.sh config.sh /
RUN mkdir -p /var/log/analytics
CMD /bin/sh /datagenerator-entrypoint.sh
