#!/bin/bash

set -e

BACKUP_DIR="./backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/hotelbooking_$TIMESTAMP.dump"

mkdir -p "$BACKUP_DIR"

docker exec hotel_postgres pg_dump -U hoteladmin -d hotelbooking -Fc > "$BACKUP_FILE"

echo "Backup created: $BACKUP_FILE"