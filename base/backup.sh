#!/bin/sh
echo "Backing up system database...";
mysqldump --lock-tables=false --single-transaction=true -h "$DATABASE_HOST" -u root -p"$MYSQL_ROOT_PASSWORD" kanmi_system | bzip2 > "/backup/database-$(date +%Y-%m-%d_%H-%M).sqldump.bz2";
