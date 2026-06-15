#!/bin/bash

# semantic_version.sh
# Handles semantic versioning for Flutter projects.
# Usage: ./bin/semantic_version.sh [major|minor|patch|build]

set -e

BUMP_TYPE=${1:-auto}
PUBSPEC_FILE="pubspec.yaml"

if [ ! -f "$PUBSPEC_FILE" ]; then
  echo "Error: $PUBSPEC_FILE not found!"
  exit 1
fi

# Extract current version
CURRENT_VERSION=$(grep '^version: ' "$PUBSPEC_FILE" | sed 's/^version: //')

if [ -z "$CURRENT_VERSION" ]; then
  echo "Error: Could not find version in $PUBSPEC_FILE"
  exit 1
fi

# Parse version (e.g., 1.0.0+1)
if [[ "$CURRENT_VERSION" =~ ^([0-9]+)\.([0-9]+)\.([0-9]+)\+([0-9]+)$ ]]; then
  MAJOR="${BASH_REMATCH[1]}"
  MINOR="${BASH_REMATCH[2]}"
  PATCH="${BASH_REMATCH[3]}"
  BUILD="${BASH_REMATCH[4]}"
elif [[ "$CURRENT_VERSION" =~ ^([0-9]+)\.([0-9]+)\.([0-9]+)$ ]]; then
  MAJOR="${BASH_REMATCH[1]}"
  MINOR="${BASH_REMATCH[2]}"
  PATCH="${BASH_REMATCH[3]}"
  BUILD=0
else
  echo "Error: version format in $PUBSPEC_FILE does not match x.y.z+n or x.y.z"
  exit 1
fi

echo "Current version: $CURRENT_VERSION"

if [ "$BUMP_TYPE" = "auto" ]; then
  echo "Auto-detecting bump type from git history..."
  if ! command -v git >/dev/null 2>&1; then
    echo "Error: git is not installed, cannot auto-detect bump type."
    exit 1
  fi
  
  LAST_TAG=$(git describe --tags --abbrev=0 --match "v*" 2>/dev/null || true)
  
  if [ -n "$LAST_TAG" ]; then
    echo "Last tag found: $LAST_TAG"
    COMMITS=$(git log ${LAST_TAG}..HEAD --format=%s)
  else
    echo "No previous tags found. Analyzing all commits."
    COMMITS=$(git log --format=%s)
  fi

  if echo "$COMMITS" | grep -qE '^(feat|feat\()'; then
    BUMP_TYPE="minor"
  elif echo "$COMMITS" | grep -qE '^(fix|fix\()'; then
    BUMP_TYPE="patch"
  else
    BUMP_TYPE="none"
  fi
  echo "Detected bump type: $BUMP_TYPE"
fi
# Bump version
case "$BUMP_TYPE" in
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
  none)
    # Don't bump, just tag the current version if not tagged
    NEW_VERSION="$CURRENT_VERSION"
    ;;
  *)
    echo "Error: Invalid bump type '$BUMP_TYPE'."
    echo "Usage: $0 [major|minor|patch|build|auto|none]"
    exit 1
    ;;
esac

if [ "$BUMP_TYPE" != "none" ]; then
  NEW_VERSION="${MAJOR}.${MINOR}.${PATCH}+${BUILD}"
  echo "New version: $NEW_VERSION"

  # Update pubspec.yaml safely on Mac/Linux
  sed -i.bak -e "s/^version: .*/version: $NEW_VERSION/" "$PUBSPEC_FILE"
  rm -f "${PUBSPEC_FILE}.bak"
else
  echo "Keeping version: $NEW_VERSION"
fi

# Commit and Tag
if command -v git >/dev/null 2>&1; then
  TAG_VERSION="${NEW_VERSION%+*}"
  # Check if tag already exists
  if git rev-parse "v$TAG_VERSION" >/dev/null 2>&1; then
    echo "Tag v$TAG_VERSION already exists. Skipping git tag."
  else
    if [ "$BUMP_TYPE" != "none" ]; then
      git add "$PUBSPEC_FILE"
      git commit --amend --no-edit
    fi
    # Only tag if we actually bumped or explicitly requested a tag
    if [ "$BUMP_TYPE" != "none" ] || ! git rev-parse "v$TAG_VERSION" >/dev/null 2>&1; then
      git tag "v$TAG_VERSION"
      echo "Git tag v$TAG_VERSION created successfully."
    fi
  fi
else
  echo "Warning: git is not installed, skipping git commit and tag."
fi
