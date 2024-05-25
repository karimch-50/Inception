#!/bin/bash


docker rm -f $(docker ps -qa)
docker rmi $(docker images)
docker volume rm $(docker volume ls)
rm -rf /home/karim/data/database/*
rm -rf /home/karim/data/wp/*

docker system prune -a -f