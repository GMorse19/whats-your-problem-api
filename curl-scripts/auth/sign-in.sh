#!/bin/bash

curl "http://localhost:4741/sign-in" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "username": "'"${NAME}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'

echo
