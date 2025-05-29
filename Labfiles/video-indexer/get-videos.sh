#!/bin/bash

# === Configuration ===
account_id="YOUR_ACCOUNT_ID"
api_key="YOUR_API_KEY"
location="trial"

# === Get access token ===
echo "Getting access token..."
token=$(curl -s -X GET "https://api.videoindexer.ai/auth/$location/Accounts/$account_id/AccessToken" \
  -H "Ocp-Apim-Subscription-Key: $api_key" \
  | tr -d '"')


# === Check if token was retrieved successfully ===
if [ -z "$token" ]; then
  echo "❌ Failed to get access token. Please check your API key and account ID."
  exit 1
fi

# === Fetch list of videos ===
echo "Fetching videos list..."
curl -s -X GET "https://api.videoindexer.ai/$location/Accounts/$account_id/Videos?accessToken=$token" \
  -H "Content-Type: application/json" \
  | jq .  # Pretty-print the JSON response (requires jq installed)
