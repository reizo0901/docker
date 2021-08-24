#!/bin/bash

if ! docker ps | grep web01 > /dev/null; then
	echo web01を起動します。
	docker start web01
else
	echo run web01
fi
if ! docker ps | grep ap01 > /dev/null; then
	echo ap01を起動します。
	docker start ap01
else
	echo run ap01
fi
if ! docker ps | grep db01 > /dev/null; then
	echo db01を起動します。
	docker start db01
else
	echo run db01
fi
docker ps -a

