#!/bin/bash
catalina.sh run &
(cd /usr/local/GgServer/ && java -jar GgServer.jar)