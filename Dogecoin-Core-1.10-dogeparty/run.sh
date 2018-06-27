#!/bin/bash

docker run \
  -dit \
  -v $(pwd)/dogecoin.conf:/root/.dogecoin/dogecoin.conf \
  -v $(pwd)/testnet3:/root/.dogecoin/testnet3 \
  dogecoin-party