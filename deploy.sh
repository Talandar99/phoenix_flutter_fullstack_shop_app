#!/bin/bash
echo "-----------------------------------"
echo "composing up frontend"
echo "-----------------------------------"
cd flutter_shop_front
docker compose up -d 
echo "frontend is running on port 8888"
cd ..
echo "-----------------------------------"
echo "composing up backend"
echo "-----------------------------------"
cd phoenix_shop_api
docker compose up -d --build
