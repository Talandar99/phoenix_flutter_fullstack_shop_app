#!/bin/bash
echo "-----------------------------------"
echo "initializing and migrating database"
echo "-----------------------------------"
cd phoenix_shop_api
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
