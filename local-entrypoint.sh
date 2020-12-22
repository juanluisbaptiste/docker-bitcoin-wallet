#!/bin/bash
env > .envrc
echo CMD="/data/bitcoin-core/bin/bitcoin-qt" >> .envrc

. /entrypoint.sh
