#!/bin/bash

set -e

BACKUP_FILE=$1
RESTORE_DB="hotelbooking_restore"

if [ -z "$BACKUP_FILE" ]; then
  echo "Usage: ./scripts/restore.sh <backup_file>"
  exit 1
fi

docker exec hotel_postgres psql -U hoteladmin -d postgres -c "DROP DATABASE IF EXISTS $RESTORE_DB;"
docker exec hotel_postgres psql -U hoteladmin -d postgres -c "CREATE DATABASE $RESTORE_DB;"

cat "$BACKUP_FILE" | docker exec -i hotel_postgres pg_restore -U hoteladmin -d "$RESTORE_DB"

echo "Restore completed into database: $RESTORE_DB"