#!/bin/bash
set -e

# Normalize line endings (important!)
sed -i 's/\r$//' scripts/replace-placeholders.sh
chmod +x scripts/replace-placeholders.sh

# Verify environment variables
echo "TARGET_SUBSCRIPTION_ID=${TARGET_SUBSCRIPTION_ID}"
echo "TARGET_RG=${TARGET_RG}"
echo "APP_INSIGHTS_NAME=${APP_INSIGHTS_NAME}"

# Run script with correct arguments
scripts/replace-placeholders.sh \
  azure-dashboards/notification-api/Dashboard.json \
  dist/Dashboard.final.json
