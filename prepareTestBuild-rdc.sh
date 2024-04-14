#!/bin/bash

# Define variables for common paths and settings
PROJECT_NAME="LambdaTestiOSDemo" # Change to your project name
SCHEME_NAME="LambdaTestiOSDemo" # Change to your schmeme name
CONFIGURATION="Debug"
SDK="iphoneos"
DERIVED_DATA_PATH="./customFolder-rdc"
BUILD_PRODUCTS_PATH="$DERIVED_DATA_PATH/Build/Products/$CONFIGURATION-$SDK"
APPS_TO_TEST_DIR="AppsToTest-rdc"

# Clean and build the project for testing
xcodebuild clean build-for-testing \
  CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO \
  -project "$PROJECT_NAME.xcodeproj" \
  -scheme "$SCHEME_NAME" \
  -sdk "$SDK" \
  -configuration "$CONFIGURATION" \
  -derivedDataPath "$DERIVED_DATA_PATH"

# Navigate to the directory containing build products
cd "$BUILD_PRODUCTS_PATH"

# Package the main app into an IPA
mkdir Payload
cp -r "$PROJECT_NAME.app" Payload/
zip --symlinks -r "$PROJECT_NAME.ipa" Payload
rm -rf Payload

# Package the test runner app into an IPA
mkdir Payload
cp -r "${PROJECT_NAME}UITests-Runner.app" Payload/
zip --symlinks -r "${PROJECT_NAME}UITests-Runner.ipa" Payload
rm -rf Payload

# Navigate back to the project root directory
cd -

# Ensure the AppsToTest directory exists and is empty
if [ ! -d "$APPS_TO_TEST_DIR" ]; then
    mkdir -p "$APPS_TO_TEST_DIR"
else
    rm -rf "$APPS_TO_TEST_DIR/*"
fi

# Copy the IPAs to the AppsToTest directory
cp "$BUILD_PRODUCTS_PATH/$PROJECT_NAME.ipa" "$APPS_TO_TEST_DIR/"
cp "$BUILD_PRODUCTS_PATH/${PROJECT_NAME}UITests-Runner.ipa" "$APPS_TO_TEST_DIR/"
