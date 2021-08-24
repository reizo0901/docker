#!/bin/bash

if docker ps | grep web01 > /dev/null; then
	echo web01を停止します。
	docker stop web01
else
	echo run web01
fi

if docker ps | grep ap01 > /dev/null; then
	echo ap01を停止します。
	docker stop ap01
else
	echo run ap01
fi

if docker ps | grep db01 > /dev/null; then
	echo db01を停止します。
	docker stop db01
else
	echo run db01
fi
docker ps -a

