# Build Process Documentation

This document describes the automated build process for the Simple Gym Tracker application, specifically focusing on generating an iOS IPA for distribution.

## Automated Build Script

To simplify the build process and ensure consistency, a shell script `build_ipa.sh` is provided in the project root. This script automates several manual steps into a single command.

### Prerequisites

Before running the build script, ensure you have the following installed and configured on your macOS machine:

1.  **Flutter SDK**: Installed and added to your `PATH`.
2.  **Xcode**: Installed with the latest command line tools.
3.  **CocoaPods**: Installed (`sudo gem install cocoapods`).
4.  **iOS Development Certificates**: Configured in Xcode for the project.

### Usage

1.  Open your terminal.
2.  Navigate to the project root directory.
3.  Run the build script:

```bash
./build_ipa.sh
```

### What the Script Does

The `build_ipa.sh` script performs the following steps in sequence:

1.  **Environment Check**: Verifies that `flutter` and `pod` commands are available.
2.  **Clean Build Cache**: Runs `flutter clean` to remove any stale build artifacts.
3.  **Update Dependencies**: Runs `flutter pub get` to ensure all Dart packages are up to date.
4.  **iOS Pod Reset**: 
    *   Navigates to the `ios/` directory.
    *   Deletes the `Pods/` folder and `Podfile.lock`.
    *   Runs `pod install` to perform a fresh installation of iOS dependencies.
5.  **Build IPA**: Executes `flutter build ipa --release` to generate the final application archive and IPA file.

### Build Outputs

Once the script completes successfully, you can find the build artifacts in the following locations:

*   **IPA File**: `build/ios/ipa/*.ipa` (Used for distribution via App Store Connect or Ad-Hoc).
*   **Xcode Archive**: `build/ios/archive/Runner.xcarchive` (Used for manual uploads or debugging symbols).

### Troubleshooting

*   **Permissions Error**: If you get a "Permission denied" error when running the script, ensure it is executable:
    ```bash
    chmod +x build_ipa.sh
    ```
*   **CocoaPods Errors**: If `pod install` fails, try updating your local pod repository:
    ```bash
    pod repo update
    ```
*   **Signing Errors**: The build might fail if Xcode cannot find a valid signing identity. Open `ios/Runner.xcworkspace` in Xcode and verify the "Signing & Capabilities" settings for the `Runner` target.

---

## Manual Build (Reference)

If you prefer to run commands manually, the standard sequence is:

```bash
flutter clean
flutter pub get
cd ios
rm -rf Pods Podfile.lock
pod install
cd ..
flutter build ipa --release
```
