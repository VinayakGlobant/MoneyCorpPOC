#!/usr/bin/env bash
set -e
echo "Validating dashboard JSON files..."
for f in dashboards/*/dashboard.json; do
  echo "Validating $f"
  jq empty "$f" || { echo "Invalid JSON: $f"; exit 1; }
done
echo "All dashboard JSON valid."
