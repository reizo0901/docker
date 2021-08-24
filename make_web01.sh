#!/bin/bash

#Dockerfile_web01の定義通りに[nginx:mainline]ダウンロードと[img_web01:1]イメージの作成
./build_web01.sh
if [ $? -ne 0 ]; then
	exit 1
fi
#[img_web01:1]イメージから[web01]コンテナ作成
./conta_web01.sh
