#!/bin/bash

set -e

REPO_URL="https://github.com/robotrainer/shvirtd-example-python-.git"
PROJECT_DIR="/opt/$(basename "${REPO_URL%.git}")"

if [ -d "${PROJECT_DIR}/.git" ]; then
    git -C "${PROJECT_DIR}" pull --ff-only
else
    git clone "${REPO_URL}" "${PROJECT_DIR}"
fi

sudo cp .env "${PROJECT_DIR}"/.env

cd "${PROJECT_DIR}"
docker compose up -d