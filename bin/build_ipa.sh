#!/bin/bash

# build_ipa.sh
# A script to build a Flutter IPA with full cache clearing and dependency updates.

# Exit on any error
set -e

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

echo "Starting IPA build process..."

# Check for required tools
if ! command_exists flutter; then
  echo "Error: flutter is not installed or not in PATH."
  exit 1
fi

if ! command_exists pod; then
  echo "Error: cocoapods (pod) is not installed."
  exit 1
fi

# 1. Clean the project
echo "Cleaning Flutter build cache..."
flutter clean

# 2. Get dependencies
echo "Fetching Flutter dependencies..."
flutter pub get

# 3. iOS specific setup
echo "Setting up iOS dependencies..."
if [ -d "ios" ]; then
  cd ios
  echo "Removing Pods folder and Podfile.lock for a fresh start..."
  rm -rf Pods
  rm -rf Podfile.lock
  
  # Update pods
  echo "Running pod install..."
  pod install
  cd ..
else
  echo "Warning: 'ios' directory not found. Skipping iOS specific setup."
fi

# 4. Build IPA
echo "Building IPA..."
# You can customize the export method (e.g., --export-method development, ad-hoc, app-store)
# By default, we use 'app-store' or whatever is configured.
# We use --release to ensure a production-ready build.
flutter build ipa --release

echo "Build completed successfully!"
echo "IPA and Archive can be found in build/ios/ipa and build/ios/archive"
