#!/bin/sh
echo "Backing up system database to discord..."
mysqldump --lock-tables=false --single-transaction=true -u root -p"$MYSQL_ROOT_PASSWORD" kanmi_system | bzip2 > "/data/upload/Backups/database-$(date +%Y-%m-%d_%H-%M).sqldump.bz2"
