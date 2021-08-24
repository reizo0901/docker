#!/bin/bash

#コンテナが存在していないか確認
if docker ps -a | grep web01 &> /dev/null; then
	echo "Error:コンテナ[web01]を削除してから再度実行してください。"
	exit 1
fi

#Dockerイメージ[img_web01:1]からコンテナ[web01]を作成
echo "Dockerコンテナ[web01]の作成を開始します。"
echo docker run -it -d --name web01 -p 80:80/tcp -p 443:443/tcp --net=jpit_nw --ip=192.168.56.16 -v /var/docker/web01/html:/usr/share/nginx/html -v /var/docker/web01/log:/var/log/nginx img_web01:1
docker run -it -d --name web01 -p 80:80/tcp -p 443:443/tcp --net=jpit_nw --ip=192.168.56.16 -v /var/docker/web01/html:/usr/share/nginx/html -v /var/docker/web01/log:/var/log/nginx img_web01:1

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
	echo "Dockerコンテナ[web01]が作成されました。"
fi
