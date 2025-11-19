#!/usr/bin/env bash
set -e
INFILE="$1"
OUTFILE="$2"

if [[ -z "$INFILE" || -z "$OUTFILE" ]]; then
  echo "Usage: $0 <infile> <outfile>"
  exit 1
fi

cp "$INFILE" "$OUTFILE"

# Replace placeholders using env variables expected to be set by pipeline
sed -i "s|\${TARGET_SUBSCRIPTION_ID}|${TARGET_SUBSCRIPTION_ID}|g" "$OUTFILE"
sed -i "s|\${TARGET_RG}|${TARGET_RG}|g" "$OUTFILE"
sed -i "s|\${APP_INSIGHTS_NAME}|${APP_INSIGHTS_NAME}|g" "$OUTFILE"
# Add other replacements as needed

echo "Wrote replaced file to $OUTFILE"
