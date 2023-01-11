#!/bin/sh
echo "Backing up system database...";
if [ -n "$1" ]
then
	/wait &&
	mysqldump --lock-tables=false --single-transaction=true -h "$DATABASE_HOST" -u root -p"$MYSQL_ROOT_PASSWORD" kanmi_system > "/backup/${1}";
else
	/wait &&
	mysqldump --lock-tables=false --single-transaction=true -h "$DATABASE_HOST" -u root -p"$MYSQL_ROOT_PASSWORD" kanmi_system | bzip2 > "/backup/database-$(date +%Y-%m-%d_%H-%M).sqldump.bz2";
fi
