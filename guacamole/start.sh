#!/bin/sh -e
/opt/guacamole/bin/start.sh &
pid=$!
while [ ! -f /usr/local/tomcat/webapps/guacamole/translations/en.json ]
do
  sleep 1
done
sed -i 's/Apache Guacamole/AAU Training Platform/g' /usr/local/tomcat/webapps/guacamole/translations/en.json
sed -i 's/"VERSION" : "/"VERSION" : "Apache Guacamole /g' /usr/local/tomcat/webapps/guacamole/translations/en.json
rm -f /usr/local/tomcat/webapps/guacamole/images/guac-tricolor.png
cp /opt/guacamole/custom/logo.png /usr/local/tomcat/webapps/guacamole/images/guac-tricolor.png
kill -9 $pid
/opt/guacamole/bin/start.sh
