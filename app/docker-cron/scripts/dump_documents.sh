#!/bin/sh
echo "`date +\%Y/\%m/\%d-\%H:\%M` - dumping all dolibarr documents from docker volume"

tar -zcf /dump/documents_`date +\%Y\%m\%d-\%H\%M`.tar.gz -C / var/www/documents/