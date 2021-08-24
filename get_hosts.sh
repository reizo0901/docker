#!/bin/bash

#コンテナ上のサーバIP取得
web01ip=`docker inspect web01 --format "{{.NetworkSettings.IPAddress}}"`
ap01ip=`docker inspect ap01 --format "{{.NetworkSettings.IPAddress}}"`
db01ip=`docker inspect db01 --format "{{.NetworkSettings.IPAddress}}"`

#サーバIPアドレスをsv_hostsファイルに出力
echo $web01ip web01 > sv_hosts
echo $ap01ip ap01 >> sv_hosts
echo $db01ip ddb01 >> sv_hosts

#サーバIPアドレス一覧を画面に出力
cat sv_hosts

