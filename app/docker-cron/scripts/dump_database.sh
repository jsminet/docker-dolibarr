#!/bin/sh
echo "`date +\%Y/\%m/\%d-\%H:\%M` - dumping database ${MYSQL_DATABASE}"

# Get the password for test or swarm prod environment
PASSWORD=${MYSQL_ROOT_PASSWORD:-`cat /run/secrets/mysql_root_password`}

mysqldump -h`echo $DOLI_DB_HOST` \
-uroot \
-p`echo $PASSWORD` \
`echo $MYSQL_DATABASE` \
--lock-tables \
--single-transaction \
--disable-keys \
--add-drop-table=TRUE \
--tables \
--complete-insert \
--extended-insert \
--hex-blob \
--default-character-set=utf8 \
| gzip -9 > /dump/dolibarr_`date +\%Y\%m\%d-\%H\%M`.sql.gz