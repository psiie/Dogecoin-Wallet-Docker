#!/bin/bash

DOGE_CONTAINER=$(docker ps -qlf "ancestor=dogecoin-party")

echo 'Quick info update:'
docker exec -it $DOGE_CONTAINER dogecoin-cli getinfo
echo 'Stopping the server safely first'
docker exec -it $DOGE_CONTAINER dogecoin-cli stop
echo 'Stopping docker container'
docker stop $DOGE_CONTAINER