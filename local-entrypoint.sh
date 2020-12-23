#!/bin/bash
env > .envrc
echo CMD="/home/user/bitcoin-core/bin/bitcoin-qt" >> .envrc

. /entrypoint.sh
