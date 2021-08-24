#!/bin/bash

#db01コンテナを停止
echo docker stop db01
docker stop db01
#db01コンテナを強制削除
echo docker rm db01 --force
docker rm db01 --force
#img_db01のイメージを強制削除
echo docker rmi img_db01:1 --force
docker rmi img_db01:1 --force
#Dockerイメージの一覧表示
docker images

