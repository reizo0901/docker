#!/bin/bash

#web01コンテナを停止
echo docker stop web01
docker stop web01
#web01コンテナを強制削除
echo docker rm web01 --force
docker rm web01 --force
#img_web01のイメージを強制削除
echo docker rmi img_web01:1 --force
docker rmi img_web01:1 --force
#Dockerイメージの一覧表示
docker images

