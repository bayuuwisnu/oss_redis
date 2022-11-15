#!/bin/bash
###########################################
#
# Script to stop all container/images
#
# The script will 
#  - Stop all running containers (if any),

# stop all running containers
echo '####################################################'
echo 'Stopping running containers (if available)...'
echo '####################################################'
sudo docker-compose stop