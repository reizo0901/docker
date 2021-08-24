#!/bin/bash

#コンテナ[web01]にnginx.confとdefault.confをコピー
echo docker cp /var/docker/web01/conf/default.conf web01:/etc/nginx/conf.d/default.conf 
docker cp /var/docker/web01/conf/default.conf web01:/etc/nginx/conf.d/default.conf 
echo docker cp /var/docker/web01/conf/nginx.conf web01:/etc/nginx/nginx.conf
docker cp /var/docker/web01/conf/nginx.conf web01:/etc/nginx/nginx.conf
#nginxのリロード
echo docker exec -it web01 nginx -s reload
docker exec -it web01 nginx -s reload

