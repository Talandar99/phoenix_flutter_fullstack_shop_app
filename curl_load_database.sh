#!/bin/bash
curl --request POST \
  --url http://localhost:4000/api/accounts/create \
  --header 'Content-Type: application/json' \
  --data '{
	"account":{
  		"email": "john@okon.com" ,
  		"password": "okoń",
  		"full_name": "Jan Okoń" ,
  		"phone_number": "791 376 666",
  		"is_admin": "true"
	}  
}'
echo ""
curl --request POST \
  --url http://localhost:4000/api/accounts/create \
  --header 'Content-Type: application/json' \
  --data '{
	"account":{
  		"email": "john@root.com" ,
  		"password": "root",
  		"full_name": "Jan Korzenny" ,
  		"phone_number": "793 676 626",
  		"is_admin": "true"
	}  
}'
echo ""
curl --request POST \
  --url http://localhost:4000/api/accounts/create \
  --header 'Content-Type: application/json' \
  --data '{
	"account":{
  		"email": "adam@juzer.com" ,
  		"password": "juzer",
  		"full_name": "Jan Juzerowy" ,
  		"phone_number": "791 222 666",
  		"is_admin": "false"
	}  
}'
echo ""
curl --request POST \
  --url http://localhost:4000/api/accounts/create \
  --header 'Content-Type: application/json' \
  --data '{
	"account":{
  		"email": "pafau@juzer.com" ,
  		"password": "juzer",
  		"full_name": "Pafeu Juzerowy" ,
  		"phone_number": "123 222 396",
  		"is_admin": "false"
	}  
}'
echo ""
TOKEN=$(curl --request POST \
  --url http://localhost:4000/api/accounts/sign_in \
  --header 'content-type: application/json' \
  --data '{
  "email": "john@okon.com" 
  ,"password": "okoń"
}' | sed -n 's/.*"token":"\([^"]*\)".*/\1/p')
echo ""
curl --request POST \
  --url http://localhost:4000/api/recipes/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '    {
      "recipe":{
      "ingredients_list": "wołowina,kapusta,sos czosnkowy",
      "title": "standard"
        }
    }'
echo ""
curl --request POST \
  --url http://localhost:4000/api/recipes/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{
      "recipe":{
      "ingredients_list": "kurczak,pomidory,ogórki,sos czosnkowy",
      "title": "Kebab z kurczakiem"
        }
    }'
echo ""
curl --request POST \
  --url http://localhost:4000/api/recipes/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{
      "recipe":{
      "ingredients_list": "baranina,papryka,jalapeno,sos BBQ",
      "title": "Kebab z baraniną"
        }
    }'
echo ""
curl --request POST \
  --url http://localhost:4000/api/recipes/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{
      "recipe":{
      "ingredients_list": "wieprzowina,ogórki kiszone,cebula,sos pomidorowy",
      "title": "Kebab z wieprzowiną"
        }
    }'
echo ""
curl --request POST \
  --url http://localhost:4000/api/recipes/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{
      "recipe":{
      "ingredients_list": "kichererbsen,cebula,czosnek,przyprawy",
      "title": "Falafel"
        }
    }'
echo ""
curl --request POST \
  --url http://localhost:4000/api/recipes/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{
      "recipe":{
      "ingredients_list": "wieprzowina,ogórki kiszone,cebula,sos pomidorowy",
      "title": "Kebab z wieprzowiną"
        }
    }'
echo ""
curl --request POST \
  --url http://localhost:4000/api/ingredients/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{ 
    "ingredient": { 
        "name": "wołowina", 
        "price": 5, 
        "ammount_left": 100
    } 
}'
echo ""
curl --request POST \
  --url http://localhost:4000/api/ingredients/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{ 
    "ingredient": { 
        "name": "kapusta", 
        "price": 1, 
        "ammount_left": 100 
    } 
}'
echo ""
curl --request POST \
  --url http://localhost:4000/api/ingredients/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{ 
    "ingredient": { 
        "name": "sos_czosnkowy", 
        "price": 0.25, 
        "ammount_left": 100
    } 
}'
echo ""
curl --request POST \
  --url http://localhost:4000/api/ingredients/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{ 
    "ingredient": { 
        "name": "kurczak", 
        "price": 3, 
        "ammount_left": 60 
    } 
}'
echo ""
curl --request POST \
  --url http://localhost:4000/api/ingredients/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{ 
    "ingredient": { 
        "name": "pomidory", 
        "price": 1.5, 
        "ammount_left": 60 
    } 
}'
echo ""
curl --request POST \
  --url http://localhost:4000/api/ingredients/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{ 
    "ingredient": { 
        "name": "ogórki", 
        "price": 1, 
        "ammount_left": 10 
    } 
}'
echo ""
curl --request POST \
  --url http://localhost:4000/api/ingredients/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{ 
    "ingredient": { 
        "name": "baranina", 
        "price": 5, 
        "ammount_left": 40 
    } 
}'
echo ""
curl --request POST \
  --url http://localhost:4000/api/ingredients/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{ 
    "ingredient": { 
        "name": "papryka", 
        "price": 1, 
        "ammount_left": 10 
    } 
}'
echo ""
curl --request POST \
  --url http://localhost:4000/api/ingredients/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{ 
    "ingredient": { 
        "name": "jalapeno", 
        "price": 1, 
        "ammount_left": 20 
    } 
}'
echo ""
curl --request POST \
  --url http://localhost:4000/api/ingredients/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{ 
    "ingredient": { 
        "name": "sos_BBQ", 
        "price": 0.5, 
        "ammount_left": 100 
    } 
}'
echo ""
curl --request POST \
  --url http://localhost:4000/api/ingredients/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{ 
    "ingredient": { 
        "name": "wieprzowina", 
        "price": 5, 
        "ammount_left": 15 
    } 
}'
echo ""
curl --request POST \
  --url http://localhost:4000/api/ingredients/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{ 
    "ingredient": { 
        "name": "cebula", 
        "price": 1, 
        "ammount_left": 17 
    } 
}'
echo ""
curl --request POST \
  --url http://localhost:4000/api/ingredients/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{ 
    "ingredient": { 
        "name": "czosnek", 
        "price": 0.5, 
        "ammount_left": 10 
    } 
}'
echo ""
curl --request POST \
  --url http://localhost:4000/api/ingredients/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{ 
    "ingredient": { 
        "name": "przyprawy", 
        "price": 0.25, 
        "ammount_left": 200 
    } 
}'
echo ""
curl --request POST \
  --url http://localhost:4000/api/ingredients/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{ 
    "ingredient": { 
        "name": "sos_pomidorowy", 
        "price": 0.5, 
        "ammount_left": 100 
    } 
}'
echo ""
curl --request POST \
  --url http://localhost:4000/api/ingredients/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{ 
    "ingredient": { 
        "name": "ogórki_kiszone", 
        "price": 1.5, 
        "ammount_left": 20 
    } 
}'
echo ""
curl --request POST \
  --url http://localhost:4000/api/sizes/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{
  "size":
    {
      "multiplier": 0.1,
      "size": "wielkości szans na zdanie javy"
    }
}'
echo ""
curl --request POST \
  --url http://localhost:4000/api/sizes/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{
  "size":
    {
      "multiplier": 0.5,
      "size": "mały"
    }
}'
echo ""
curl --request POST \
  --url http://localhost:4000/api/sizes/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{
  "size":
    {
      "multiplier": 1,
      "size": "średni"
    }
}'
echo ""
curl --request POST \
  --url http://localhost:4000/api/sizes/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{
  "size":
    {
      "multiplier": 2,
      "size": "duży"
    }
}'
echo ""
curl --request POST \
  --url http://localhost:4000/api/sizes/create \
  --header "Authorization: Bearer $TOKEN" \
  --header 'content-type: application/json' \
  --data '{
  "size":
    {
      "multiplier": 5,
      "size": "potężny"
    }
}'
echo ""
