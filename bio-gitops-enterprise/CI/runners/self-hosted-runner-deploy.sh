#!/usr/bin/env bash
# Bootstrap script for GitHub self-hosted runner

GITHUB_OWNER="your-org"
REPO="bio-gitops-enterprise"
RUNNER_VERSION="2.298.0"

# Download and extract runner
curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
mkdir actions-runner && tar xzf actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz -C actions-runner
cd actions-runner

# Configure runner
./config.sh --url https://github.com/${GITHUB_OWNER}/${REPO} --token YOUR_TOKEN --labels "self-hosted,Linux,X64"

# Start runner
./run.sh
