#!/bin/bash

# COLOURS

BLUE=$'\033[0;34m'
RED=$'\033[0;31m'
YELLOW=$'\033[0;33m'
GREEN=$'\033[0;32m'
RESET=$'\033[0;39m'

# MAIN SCRIPT

echo -e "\n$GREEN[+]$RESET CLEAN UP SCRIPT STARTED\n"

vagrant global-status --prune &>/dev/null

echo -e "$GREEN[+]$RESET CLEANING...\n"

while true; do
    vagrant destroy --force $(vagrant global-status | awk '{print $1}' | head -3 | tail -1) &>/dev/null || break;
done

rm ./node-token &>/dev/null

echo -en "\007"
echo -e "$GREEN[+]$RESET CLEAN UP SCRIPT FINISHED\n"