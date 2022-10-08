if [ -n "$1" ]
then
	/wait &&
	mysql -uroot -p"$MYSQL_ROOT_PASSWORD" kanmi_system < "/backup/${1}"
else
	/wait &&
	bzip2 -d "/backup/restore.sqldump.bz2" &&
    mysql -uroot -p"$MYSQL_ROOT_PASSWORD" kanmi_system < "/backup/restore.sqldump" &&
    rm "/backup/restore.sqldump"
fi
