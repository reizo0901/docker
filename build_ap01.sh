#!/bin/bash

#[img_ap01:1]確認
if docker images | grep img_ap01 &> /dev/null; then
	echo "Error:イメージ[img_ap01]を削除してから再度実行してください。"
	exit 1
fi

#Dockerイメージを作成する。
echo docker build -t img_ap01:1 -f Dockerfile_ap01 .
docker build -t img_ap01:1 -f Dockerfile_ap01 .

#-t ターゲットイメージ
#-f Dockerfile名 ※指定しない場合はカレントフォルダのDockerfileとなる。

if [ $? -ne 0 ]; then
	echo "Error:[img_ap01:1]の作成に失敗しました。"
	echo "[Dockerfile_ap01]で発生しているエラーを修正してください。"
	echo "再度実行する場合はイメージ[img_ap01:1]の削除が必要です。"
	echo "削除コマンド:docker rmi img_ap01:1 --force"
	echo "※REPOSITORYがが<none>になっている場合はイメージ名ではなくIMAGE_IDを入力が必要。"
	exit 1
else
	echo "Dockerイメージ[img_ap01:1]が作成されました。"
fi
exit 0

