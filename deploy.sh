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
sleep 5
echo "waiting"
sleep 5
echo "waiting"
sleep 5
echo "-----------------------------------"
echo "initializing and migrating database"
echo "-----------------------------------"
./init_database.sh
echo "-----------------------------------"
echo "loading database"
echo "-----------------------------------"
cd ..
./curl_load_database.sh

echo "-----------------------------------"
echo "frontend is running on port 8888"
echo "phoenix api is running on port 4000"
echo "postgresql is running on port 5432"
echo "-----------------------------------"
