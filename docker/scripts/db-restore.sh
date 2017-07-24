# Restore
if [ "$#" -ne 1 ]; then
    echo "This script requires 1 argument. Pass the container name or ID."
	exit 1;
fi

if [ ! "$(docker ps -q -f name=$1)" ]; then
	echo 'Docker container not found.'
	exit 1;
fi

if [ ! -f `pwd`/db-backup.sql ]; then
    echo "File db-backup.sql not found!"
    exit 1;
fi

echo "Restoring the database in container \"$1\" from the file \"db-backup.sql\"";
cat db-backup.sql | docker exec -i $1 /usr/bin/mysql -u root --password=root wordpress
