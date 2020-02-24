#!/bin/bash

curl "http://localhost:4741/problems" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "problem": {
      "name": "'"${NAME}"'",
      "content": "'"${CONTENT}"'",
      "hint": "'"${HINT}"'",
      "solution": "'"${SOLUTION}"'",
      "answer": "'"${ANSWER}"'",
      "category": "'"${CAT}"'",
      "rating": "'"${RATING}"'"
    }
  }'

echo
