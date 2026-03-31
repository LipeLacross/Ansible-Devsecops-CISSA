#!/bin/bash
# config_app_bad.sh

DB_HOST="localhost"
DB_NAME="dev_db"
DB_USER="admin"

TARGET="/tmp/app.conf"

echo "Configurando aplicacao..."
echo -e "db_host=$DB_HOST\ndb_name=$DB_NAME" > $TARGET

echo "Arquivo gerado em $TARGET:"
cat $TARGET