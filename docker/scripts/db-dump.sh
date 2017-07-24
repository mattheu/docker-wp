# Backup


# Restore
# cat backup.sql | docker exec -i CONTAINER /usr/bin/mysql -u root --password=root DATABASE

if [ "$#" -ne 1 ]; then
    echo "This script requires 1 argument. Pass the container name or ID."
	exit 1;
fi

if [ ! "$(docker ps -q -f name=$1)" ]; then
	echo 'Docker container not found.'
	exit 1;
fi


echo "Saving a dump of the database from container \"$1\" to file \"db-backup.sql\"";
docker exec $1 /usr/bin/mysqldump -u root --password=root wordpress > db-backup.sql
