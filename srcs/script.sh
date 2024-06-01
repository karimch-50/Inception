#!/bin/bash


docker rm -f $(docker ps -qa)
docker rmi $(docker images)
docker volume rm $(docker volume ls)
rm -rf /home/karim/Desktop/data/database/*
rm -rf /home/karim/Desktop/data/wordpress/*

docker system prune -a -f