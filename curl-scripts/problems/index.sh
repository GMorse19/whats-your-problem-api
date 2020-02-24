#!/bin/bash

curl "http://localhost:4741/problems" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
