#!/bin/bash
set -e

# employees.sql uses `source` client commands to load dump files,
# so we change to /sql-files first so relative paths resolve correctly.
cd /sql-files

echo "[init] Loading employees schema and data..."
mysql -uroot -p"${MYSQL_ROOT_PASSWORD}" < employees.sql

echo "[init] Loading stored procedures and functions..."
mysql -uroot -p"${MYSQL_ROOT_PASSWORD}" employees < objects.sql

echo "[init] Done. employees database is ready."
