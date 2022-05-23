#!/usr/bin/env bash
NEW_ENVIRONMENT=$(echo $PLATFORM_ROUTES | base64 --decode | jq -r 'to_entries[] | select(.value.id == "api") | .key')
SITE_BASE_URL=${NEW_ENVIRONMENT%/}
UPDATED_DATA=$(jq --arg SITE_BASE_URL "$SITE_BASE_URL" '.environment.api.url.base = $SITE_BASE_URL' $ENV_SETTINGS)
echo $UPDATED_DATA > $ENV_SETTINGS
