#!/bin/bash

set -a
source .env.backup
set +a

set -e

BACKUP_DIR="/opt/backup"
mkdir -p "$BACKUP_DIR"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_${TIMESTAMP}.sql"

docker run --rm \
  --network shvirtd-example-python-_backend \
  --entrypoint "" \
  -v "${BACKUP_DIR}:/backup" \
  mysql:8 \
  mysqldump --opt -h "${DB_HOST}" -u "${DB_USER}" -p"${DB_PASSWORD}" --result-file="/backup/${DB_NAME}_${TIMESTAMP}.sql" "$DB_NAME"