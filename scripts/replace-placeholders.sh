#!/bin/bash
set -e

echo "Running placeholder replacement safely..."

# Create a temp workspace OUTSIDE TeamCity checkout dir
WORKDIR=$(mktemp -d)

# Copy replacer script to temp dir
cp scripts/replace-placeholders.sh "$WORKDIR/replacer.sh"
chmod +x "$WORKDIR/replacer.sh"

# Copy input file to temp dir
cp dashboards/dashboard.json "$WORKDIR/input.json"

# Run script on temp copies ONLY
"$WORKDIR/replacer.sh" \
    "$WORKDIR/input.json" \
    "$WORKDIR/output.json"

# Copy ONLY the final output to dist (allowed)
mkdir -p dist
cp "$WORKDIR/output.json" dist/dashboard.final.json

echo "Replacement complete."
