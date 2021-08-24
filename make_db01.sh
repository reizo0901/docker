#!/bin/bash

#Dockerfile_db01の定義通りに[nginx:mainline]ダウンロードと[img_db01:1]イメージの作成
./build_db01.sh
if [ $? -ne 0 ]; then
	exit 1
fi
#[img_db01:1]イメージから[db01]コンテナ作成
./conta_db01.sh
