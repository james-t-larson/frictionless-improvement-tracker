#!/usr/bin/env bash
# Script to launch a simulator/emulator

TARGET=$1

if [ -z "$TARGET" ]; then
    while true; do
        read -p "Which simulator would you like to start? (ios/android): " user_input
        case $user_input in
            ios|android)
                TARGET=$user_input
                break
                ;;
            *)
                echo "Please enter 'ios' or 'android'."
                ;;
        esac
    done
fi

case "$TARGET" in
    ios|--ios)
        echo "Starting iOS Simulator..."
        flutter emulators --launch apple_ios_simulator
        ;;
    android|--android)
        echo "Starting Android Emulator..."
        flutter emulators --launch Medium_Phone_API_36.1
        ;;
    *)
        echo "Invalid option: $TARGET"
        echo "Usage: ./bin/start [ios|android]"
        exit 1
        ;;
esac
