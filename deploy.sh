#!/bin/bash

set -e

REPO_URL="https://github.com/robotrainer/shvirtd-example-python-.git"
PROJECT_DIR="/opt/$(basename "${REPO_URL%.git}")"

git clone "${REPO_URL}" "${PROJECT_DIR}"

cd "${PROJECT_DIR}"
docker compose up -d