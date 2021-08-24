#!/bin/bash

#コンテナが存在していないか確認
if docker ps -a | grep db01 &> /dev/null; then
	echo Error:コンテナ[db01]を削除してから再度実行してください。
	exit 1
fi

#Dockerイメージ[img_db01:1]からコンテナ[web01]を作成
echo docker run -it -d --name db01 -p 5432:5432/tcp --net=jpit_nw --ip=192.168.56.18 -v /var/docker/db01/data:/var/lib/postgresql/data -e POSTGRES_PASSWORD=Jp1t@dm1n img_db01:1
docker run -it -d --name db01 -p 5432:5432/tcp --net=jpit_nw --ip=192.168.56.18 -v /var/docker/db01/data:/var/lib/postgresql/data -e POSTGRES_PASSWORD=Jp1t@dm1n img_db01:1

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
	echo "Dockerコンテナ[db01]が作成されました。"
fi
