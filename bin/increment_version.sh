#!/bin/bash

# increment_version.sh
# Increments the semantic version in pubspec.yaml
# Usage: ./bin/increment_version.sh [major|minor|patch|build]
# Default is 'build'

set -e

PUBSPEC_FILE="pubspec.yaml"

# Ensure we are in the project root by checking if pubspec.yaml exists
if [ ! -f "$PUBSPEC_FILE" ]; then
  echo "Error: $PUBSPEC_FILE not found. Please run this script from the project root."
  exit 1
fi

# Extract the current version line
VERSION_LINE=$(grep "^version: " "$PUBSPEC_FILE")
if [ -z "$VERSION_LINE" ]; then
  echo "Error: version line not found in $PUBSPEC_FILE"
  exit 1
fi

# Remove 'version: ' prefix and any trailing whitespace
CURRENT_VERSION=$(echo "$VERSION_LINE" | sed -e 's/^version: //' -e 's/[[:space:]]*$//')

# Extract semantic version parts
if [[ "$CURRENT_VERSION" =~ ^([0-9]+)\.([0-9]+)\.([0-9]+)\+([0-9]+)$ ]]; then
  MAJOR="${BASH_REMATCH[1]}"
  MINOR="${BASH_REMATCH[2]}"
  PATCH="${BASH_REMATCH[3]}"
  BUILD="${BASH_REMATCH[4]}"
elif [[ "$CURRENT_VERSION" =~ ^([0-9]+)\.([0-9]+)\.([0-9]+)$ ]]; then
  MAJOR="${BASH_REMATCH[1]}"
  MINOR="${BASH_REMATCH[2]}"
  PATCH="${BASH_REMATCH[3]}"
  BUILD="0"
else
  echo "Error: Unrecognized version format '$CURRENT_VERSION'. Expected format: X.Y.Z or X.Y.Z+B"
  exit 1
fi

INCREMENT_TYPE="${1:-build}"

case "$INCREMENT_TYPE" in
  major)
    MAJOR=$((MAJOR + 1))
    MINOR=0
    PATCH=0
    BUILD=1
    ;;
  minor)
    MINOR=$((MINOR + 1))
    PATCH=0
    BUILD=1
    ;;
  patch)
    PATCH=$((PATCH + 1))
    BUILD=1
    ;;
  build)
    BUILD=$((BUILD + 1))
    ;;
  *)
    echo "Error: Invalid increment type '$INCREMENT_TYPE'. Use major, minor, patch, or build."
    exit 1
    ;;
esac

NEW_VERSION="${MAJOR}.${MINOR}.${PATCH}+${BUILD}"
echo "Bumping version: $CURRENT_VERSION -> $NEW_VERSION"

# Replace the version in pubspec.yaml in a cross-platform way
sed -i.bak "s/^version: .*/version: $NEW_VERSION/" "$PUBSPEC_FILE"
rm -f "${PUBSPEC_FILE}.bak"

echo "Version updated successfully."
