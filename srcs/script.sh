#!/bin/bash


docker rm -f $(docker ps -qa)
docker rmi $(docker images)
docker system prune -a -f