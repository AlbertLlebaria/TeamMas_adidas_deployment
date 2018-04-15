#!/usr/bin/env bash


main (){

curl -X POST \
  http://localhost:5000/v3/users \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H "x-auth-token: "$1 \
  -d '{
    "user": {
        "default_project_id": "idm_project",
        "domain_id": "default",
        "enabled": true,
        "name": "WilmaOrion",
        "password": "SadFiware",
        "description": "Wilma Orion user",
        "email": "allebaria@bettaircities.com",
        "username":"WilmaOrion"
    }
}'

curl -X POST \
  http://localhost:5000/v3/users \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H "x-auth-token: "$1 \
  -d '{
    "user": {
        "default_project_id": "idm_project",
        "domain_id": "default",
        "enabled": true,
        "name": "IoTAgent",
        "password": "LlebaAgent",
        "description": "IoT Agent user",
        "email": "allebaria@bettaircities.com",
        "username":"IoTAgent"
    }
}'




curl -X POST \
  http://localhost:5000/v3/users \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H "x-auth-token: "$1 \
  -d '{
    "user": {
        "default_project_id": "idm_project",
        "domain_id": "default",
        "enabled": true,
        "name": "WilmaAPI",
        "password": "GreatAPI",
        "description": "Wilma API user",
        "email": "allebaria@bettaircities.com",
        "username":"WilmaAPI"
    }
}'

curl -X POST \
  http://localhost:5000/v3/users \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H "x-auth-token: "$1 \
  -d '{
    "user": {
        "default_project_id": "idm_project",
        "domain_id": "default",
        "enabled": true,
        "name": "BettDevices",
        "password": "TillICollapse",
        "description": "Bet devices API user",
        "email": "allebaria@bettaircities.com",
        "username":"BettDevices"
    }
}'

curl -X PUT \
  http://localhost:5000/v3/projects/idm_project/users/wilmaorion/roles/$2 \
  -H 'cache-control: no-cache' \
  -H "x-auth-token: "$1

curl -X PUT \
  http://localhost:5000/v3/projects/idm_project/users/wilmaapi/roles/$2 \
  -H 'cache-control: no-cache' \
  -H "x-auth-token: "$1
curl -X PUT \
  http://localhost:5000/v3/projects/idm_project/users/iotagent/roles/$2 \
  -H 'cache-control: no-cache' \
  -H "x-auth-token: "$1
curl -X PUT \
  http://localhost:5000/v3/projects/idm_project/users/bettdevices/roles/$2 \
  -H 'cache-control: no-cache' \
  -H "x-auth-token: "$1



}

main "$@"
