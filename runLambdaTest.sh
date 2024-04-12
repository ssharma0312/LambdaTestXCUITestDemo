# Prepare the App and Test-Runner ipa files for LambdaTest
#sh prepareTestBuild-rdc.sh

# Configure environment variables
export LT_USERNAME=sam.shar99
export LT_ACCESS_KEY=uVFcrGeLUwYBUAYkiyA6auIXYPW0YZNlHGdT2gYPsIztDyq3j0

# Allow permissions
chmod u+x ./LambdaTestFiles/hyperexecute

# Execute test suite
./LambdaTestFiles/hyperexecute --config ./LambdaTestFiles/hyperexecute-xcui.yaml