#
# Usage: java -cp data-generator-1.0-SNAPSHOT-jar-with-dependencies.jar com.wizni.DataGenerator <filename> <frequency> <hoursOffsetInPast> <hoursOffsetInFuture>
# where,
# 	filename: file where data would be appended
# 	frequency: time interval after which new line will be appended
# 	hoursOffsetInPast: hours from current time to be used as start data time
# 	hoursOffsetInFuture: hours in future from current time to be used as end data time
#
# Example : 
#
# (1) To generate data between some past timestamp and future timestamp
# java -cp ./bin/data-generator-1.0-SNAPSHOT-jar-with-dependencies.jar com.wizni.DataGenerator /var/log/analytics/wize-java.log 5000 192 1
# Assuming current time is Thu, 05 May 2016 14:53:47.861 GMT,
# Above generates logs between startTimeEpochMsec[1461768827861] till endTimeEpochMsec[1462460027861] with each log [5000]msec apart
#
# (2) To continuously generate data with wall-clock time,
# java -cp ./bin/data-generator-1.0-SNAPSHOT-jar-with-dependencies.jar com.wizni.DataGenerator /var/log/analytics/wize-java.log 5000
# Assuming current time is Thu, 05 May 2016 14:57:44.502 GMT,
# Above generates logs between startTimeEpochMsec[1462460264502] till endTimeEpochMsec[1462460264502] with each log [5000]msec apart 
# Here, startTimeEpochMsec is current time and endTimeEpochMsec = startTimeEpochMsec means logs will keep coming until stopped using ctrl+c
#
. /config.sh
java -cp datagenerator.jar com.wizni.DataGenerator ${LOG_FILE} ${FREQUENCY}
