#!/bin/sh
echo "`date +\%Y/\%m/\%d-\%H:\%M` - dumping database ${MYSQL_DATABASE}"

mysqldump -h`echo $DOLI_DB_HOST` \
-uroot \
-p`echo $MYSQL_ROOT_PASSWORD` \
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