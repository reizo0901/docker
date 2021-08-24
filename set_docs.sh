#!/bin/bash

#apサーバ用Dockerディレクトリ作成
mdir=/usr/share/dockers/ap01;[ ! -e $mdir ] && mkdir -p $mdir
mdir=/usr/share/dockers/ap01/setup;[ ! -e $mdir ] && mkdir -p $mdir
mdir=/usr/share/dockers/ap01/logs;[ ! -e $mdir ] && mkdir -p $mdir
mdir=/usr/share/dockers/ap01/conf;[ ! -e $mdir ] && mkdir -p $mdir
mdir=/usr/share/dockers/ap01/webapps;[ ! -e $mdir ] && mkdir -p $mdir
echo "apサーバのディレクトリを作成しました。"

#apサーバ用資材格納
cp build_ap01.sh /usr/share/dockers/ap01/setup/
cp conta_ap01.sh /usr/share/dockers/ap01/setup/
cp make_ap01.sh /usr/share/dockers/ap01/setup/
cp Dockerfile_ap01 /usr/share/dockers/ap01/setup/
cp start_uwsgi.sh /usr/share/dockers/ap01/setup/
cp stop_uwsgi.sh /usr/share/dockers/ap01/setup/
cp requirements.txt /usr/share/dockers/ap01/webapps/
cp uwsgi.ini /usr/share/dockers/ap01/webapps/
cp run.py /usr/share/dockers/ap01/webapps/
cp stop_uwsgi.sh /usr/share/dockers/ap01/setup/
cp stop_uwsgi.sh /usr/share/dockers/ap01/setup/
cp chg_conf_ap01.sh /usr/share/dockers/ap01/conf/
chmod 777 /usr/share/dockers/ap01/setup/*.sh
echo "apサーバ用の資材を格納しました。"

#dbサーバ用Dockerディレクトリ作成
mdir=/usr/share/dockers/db01;[ ! -e $mdir ] && mkdir -p $mdir
mdir=/usr/share/dockers/db01/setup;[ ! -e $mdir ] && mkdir -p $mdir
mdir=/usr/share/dockers/db01/data;[ ! -e $mdir ] && mkdir -p $mdir
echo "dbサーバのディレクトリを作成しました。"

#dbサーバ用資材格納
cp build_db01.sh /usr/share/dockers/db01/setup/
cp conta_db01.sh /usr/share/dockers/db01/setup/
cp make_db01.sh /usr/share/dockers/db01/setup/
cp Dockerfile_db01 /usr/share/dockers/db01/setup/
chmod 777 /usr/share/dockers/db01/setup/*.sh
echo "dbサーバ用の資材を格納しました。"

#webサーバ用Dockerディレクトリ作成
mdir=/usr/share/dockers/web01;[ ! -e $mdir ] && mkdir -p $mdir
mdir=/usr/share/dockers/web01/setup;[ ! -e $mdir ] && mkdir -p $mdir
mdir=/usr/share/dockers/web01/conf;[ ! -e $mdir ] && mkdir -p $mdir
mdir=/usr/share/dockers/web01/html;[ ! -e $mdir ] && mkdir -p $mdir
mdir=/usr/share/dockers/web01/log;[ ! -e $mdir ] && mkdir -p $mdir
mdir=/usr/share/dockers/web01/ssl;[ ! -e $mdir ] && mkdir -p $mdir
echo "webサーバのディレクトリを作成しました。"

#webサーバ用資材格納
cp build_web01.sh /usr/share/dockers/web01/setup/
cp conta_web01.sh /usr/share/dockers/web01/setup/
cp make_web01.sh /usr/share/dockers/web01/setup/
cp Dockerfile_web01 /usr/share/dockers/web01/setup/
cp chg_conf_web01.sh /usr/share/dockers/web01/conf/
cp nginx.conf /usr/share/dockers/web01/conf/
cp default.conf /usr/share/dockers/web01/conf/
cp default.conf2 /usr/share/dockers/web01/conf/
cp nginx.conf /usr/share/dockers/web01/setup/
cp default.conf /usr/share/dockers/web01/setup/
cp server.key /usr/share/dockers/web01/ssl/
cp server.csr /usr/share/dockers/web01/ssl/
cp server.crt /usr/share/dockers/web01/ssl/
cp -r /usr/share/dockers/web01/ssl/ /usr/share/dockers/web01/setup/ssl/
chmod 777 /usr/share/dockers/web01/setup/*.sh
echo "webサーバ用の資材を格納しました。"

echo "各サーバを構築するには、/usr/share/dockers/[サーバ名]フォルダ配下のsetupフォルダに配置されているmake_[サーバ名].shを実行してください。"
echo "例: ./make_web01.sh[Enter]"

