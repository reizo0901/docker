#!/bin/bash

#コンテナが存在していないか確認
if docker ps -a | grep ap01 &> /dev/null; then
	echo Error:コンテナ[ap01]を削除してから再度実行してください。
	exit 1
fi

#Dockerをコンテナとして作成し、起動する。
echo docker run -it -d --name ap01 -p 3031:3031/tcp --net=ctl_nw --ip=192.168.56.17 -v /usr/share/dockers/ap01/webapps:/var/www -v /usr/share/dockers/ap01/logs:/var/log/uwsgi/ img_ap01:1
docker run -it -d --name ap01 -p 3031:3031/tcp --net=ctl_nw --ip=192.168.56.17 -v /usr/share/dockers/ap01/webapps:/var/www -v /usr/share/dockers/ap01/logs:/var/log/uwsgi/ img_ap01:1

#-it iはホストの入力をコンテナの標準出力につなげる tはコンテナの標準出力とホストの標準出力をつなげる
#-d コンテナをバックグランドモードで実行
#--name コンテナの名匠
#-p ホストと通信可能なポートフォワード設定 host:container
#--ip 静的IPアドレス設定
#-v マウントボリューム
#末尾 イメージ名

if [ $? -ne 0 ]; then
	echo "Error:コンテナの作成に失敗しました。"
	exit 1
else
	echo "Dockerコンテナ[ap01]が作成されました。"
fi

#webappsフォルダの内容を復元
#echo docker exec -it ap01 cp -r /opt/tomcat/webapps_bk/. /opt/tomcat/webapps
#docker exec -it ap01 cp -r /opt/tomcat/webapps_bk/. /opt/tomcat/webapps

#confフォルダの内容をホストに複製 ※マウントは行いません
#echo docker cp ap01:/opt/tomcat/conf/. /usr/share/dockers/ap01/conf
#docker cp ap01:/opt/tomcat/conf/. /usr/share/dockers/ap01/conf

#Tomcatを通常モードで起動
#docker exec -d ap01 /opt/tomcat/bin/catalina.sh start 

#docker exec -it [コンテナ名] コンテナ上で実行したいコマンド

#設定されたIPアドレスをファイルに出力
echo docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ap01 > ap01_ip.txt
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ap01 > ap01_ip.txt

if [ $? -ne 0 ]; then
	echo "Error:コンテナのIPアドレスの出力に失敗しました。"
	exit 1
fi
