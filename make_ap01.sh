#!/bin/bash

#Dockerfile_ap01の定義通りに[nginx:mainline]ダウンロードと[img_ap01:1]イメージの作成
./build_ap01.sh
if [ $? -ne 0 ]; then
	exit 1
fi
#[img_ap01:1]イメージから[ap01]コンテナ作成
./conta_ap01.sh
