#!/bin/bash

set -e

REPO_URL="https://github.com/robotrainer/shvirtd-example-python-.git"
PROJECT_DIR="/opt/$(basename "${REPO_URL%.git}")"

sudo git clone "${REPO_URL}" "${PROJECT_DIR}"

sudo cp .env "${PROJECT_DIR}"/.env

cd "${PROJECT_DIR}"
docker compose up -d