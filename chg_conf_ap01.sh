#!/bin/bash
#コンテナ[ap01]のTomcatサービスを停止
echo docker exec -d ap01 /opt/tomcat/bin/catalina.sh stop
docker exec -d ap01 /opt/tomcat/bin/catalina.sh stop
#コンテナ[ap01]にconfディレクトリ配下のファイルをすべてコピー
echo docker cp /var/docker/ap01/conf/. ap01:/opt/tomcat/conf
docker cp /var/docker/ap01/conf/. ap01:/opt/tomcat/conf
#コンテナ[ap01]のTomcatサービスを開始
echo docker exec -d ap01 /opt/tomcat/bin/catalina.sh run
docker exec -d ap01 /opt/tomcat/bin/catalina.sh run
