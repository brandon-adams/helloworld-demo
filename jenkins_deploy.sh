#!/bin/bash -ex

bash $WORKSPACE/gradlew build
cf login -a http://api.192.168.4.14.xip.io -u admin -p password -o newwave -s dev
cf push --no-start
APP_NAME=`cat manifest.yml | grep -i name | awk '{ print $3 }'`
#cf restage $APP_NAME
#cf start $APP_NAME
sudo /opt/IBM/WebSphere/AppServer/profiles/demo-zYHBt-dmgr/bin/wsadmin.sh -lang jython -f /home/opstack/deployWAR.py demo-zYHBt-mngd-AppNode demo-zYHBt-dmgr-yvs4W-srvr $WORKSPACE/build/libs/helloworld.war
