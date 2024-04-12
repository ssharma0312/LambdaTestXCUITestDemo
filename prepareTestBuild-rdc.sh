xcodebuild \
  CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO \
  clean build-for-testing \
  -project LambdaTestiOSDemo.xcodeproj \
  -scheme "LambdaTestiOSDemo" \
  -sdk iphoneos \
  -configuration Debug \
  -derivedDataPath './customFolder-rdc'


cd customFolder-rdc/Build/Products/Debug-iphoneos
mkdir Payload
cp -r LambdaTestiOSDemo.app Payload/
zip --symlinks -r LambdaTestiOSDemo.ipa Payload
rm -rf Payload; mkdir Payload
cp -r LambdaTestiOSDemoUITests-Runner.app Payload/
zip --symlinks -r LambdaTestiOSDemoUITests-Runner.ipa Payload

cd ../../../..

# Check if AppsToTest folder exists, create one if not, and ensure it's empty
if [ ! -d "AppsToTest-rdc" ]; then
    mkdir -p AppsToTest-rdc
else
    rm -rf AppsToTest-rdc/*
fi


# Copy .ipa to AppToTest-rdc folder
cp customFolder-rdc/Build/Products/Debug-iphoneos/LambdaTestiOSDemo.ipa AppsToTest-rdc/
cp customFolder-rdc/Build/Products/Debug-iphoneos/LambdaTestiOSDemoUITests-Runner.ipa AppsToTest-rdc/
