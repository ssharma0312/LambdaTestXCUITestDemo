# XCUITest Sample Project with LambdaTest Integration

## Overview
This repository contains a sample iOS XCUITest project configured to run tests on LambdaTest's cloud test execution platform. Every merge request to the main branch triggers a GitHub Actions workflow that builds the iOS app, creates an `.ipa` and an XCUITest runner, and then executes tests on LambdaTest.

## Getting Started

### Prerequisites
- Xcode 15.2 or later.
- A LambdaTest account.
- Access to a macOS environment with the necessary tools installed for iOS app development and testing.

### Setting Up Your Environment
To run tests in this project, you will need to configure two environment variables in your GitHub repository:
- `LT_USERNAME`: Your LambdaTest username.
- `LT_ACCESS_KEY`: Your LambdaTest access key.

These credentials can be obtained from your LambdaTest portal.

#### Configuring Environment Variables on GitHub
1. Go to your repository on GitHub.
2. Click on `Settings` > `Secrets` > `New repository secret`.
3. Add `LT_USERNAME` and its value, then repeat for `LT_ACCESS_KEY`.

### Running Tests Locally
To run your tests locally before pushing to GitHub:
1. Open the terminal.
2. Navigate to your project directory.
3. Change `LT_USERNAME` and `LT_ACCESS_KEY` with your values.
4. Run `sh prepareTestBuild-rdc` to prepare the .ipa, and xcuitest runner files.
5. Run `sh runLambdaTest.sh` to execute the tests on lambdaTest

## GitHub Actions Workflow
The `.github/workflows/github_workflow.yml` file contains the GitHub Actions workflow responsible for:
1. Setting XCode version to 15.2
2. Checking out the code.
3. Preparing the test build.
4. Listing generated files for debugging.
5. Running tests on LambdaTest.

Each pull request to `main` will trigger this workflow.

## LambdaTest Configuration
To configure test runs on LambdaTest, modify the `LambdaTestFiles/hyperexecute-xcui.yml` according to your test requirements. Uncomment the appropriate lines in the GitHub Actions workflow file to switch between simulator and real device tests. For more details: https://www.lambdatest.com/support/docs/deep-dive-into-hyperexecute-yaml/

## Support
For additional help with configuring or using this project, please refer to the official [LambdaTest Documentation](https://www.lambdatest.com/support/docs/getting-started-with-lambdatest-automation/). Contact LambdaTest support for more assistance.

---

**Note**: Always ensure your local development environment matches the configurations expected by the CI/CD pipelines to minimize discrepancies in test results.

Happy Testing!
