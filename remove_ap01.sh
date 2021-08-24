#!/bin/bash

#ap01コンテナを停止
echo docker stop ap01
docker stop ap01
#ap01コンテナを強制削除
echo docker rm ap01 --force
docker rm ap01 --force
#img_ap01のイメージを強制削除
echo docker rmi img_ap01:1 --force
docker rmi img_ap01:1 --force
#Dockerイメージの一覧表示
docker images

