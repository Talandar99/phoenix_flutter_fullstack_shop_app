#!/bin/bash
docker exec -it $(docker ps --filter name=phoenix_shop_api-web -q) mix ecto.create
docker exec -it $(docker ps --filter name=phoenix_shop_api-web -q) mix ecto.migrate
