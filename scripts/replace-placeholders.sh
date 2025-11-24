#!/bin/bash
set -e

# Create safe temp copy of the replacer script
TMP_SCRIPT=$(mktemp)
cp scripts/replace-placeholders.sh "$TMP_SCRIPT"
chmod +x "$TMP_SCRIPT"

echo "TARGET_SUBSCRIPTION_ID=$TARGET_SUBSCRIPTION_ID"
echo "TARGET_RG=$TARGET_RG"
echo "APP_INSIGHTS_NAME=$APP_INSIGHTS_NAME"

# Run on a temp work copy of the dashboard too (avoid modifying the repo)
cp azure-dashboards/notification-api/Dashboard.json /tmp/dashboard.json

"$TMP_SCRIPT" /tmp/dashboard.json /tmp/dashboard.final.json

# Only copy the final file to dist (TeamCity allows this)
mkdir -p dist
cp /tmp/dashboard.final.json dist/dashboard.final.json

echo "Done."
