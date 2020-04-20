curl "http://localhost:4741/problems/${ID}/unlike" \
  --include \
  --request PUT \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \

echo
