# Ex: TOKEN=tokengoeshere ID=idgoeshere TEXT=textgoeshere sh curl-scripts/examples/update.sh

curl "http://localhost:4741/problems/${ID}" \
  --include \
  --request PATCH \
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
