#!/bin/bash
################################################################################
# Date:     04/04/2017
# Author:   dbrosy
# Web:      
#
# Purpose:  Install or Update speedtest-cli on Edgerouter
# 
# Usage:    update_speedtest.sh
################################################################################

# download latest speedtest-cli from github
curl -Lo speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py

# set execute permissions
chmod +x speedtest-cli

# move to bin folder to allow running from anywhere
mv speedtest-cli /usr/local/bin/speedtest-cli
