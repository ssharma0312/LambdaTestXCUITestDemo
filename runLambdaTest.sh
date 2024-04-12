# Prepare the App and Test-Runner ipa files for LambdaTest
#sh prepareTestBuild-rdc.sh

# Configure environment variables
export LT_USERNAME=$LT_USERNAME
export LT_ACCESS_KEY=$LT_ACCESS_KEY

# Allow permissions
chmod u+x ./LambdaTestFiles/hyperexecute

# Execute test suite
./LambdaTestFiles/hyperexecute --config ./LambdaTestFiles/hyperexecute-xcui.yaml