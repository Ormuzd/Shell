#!/bin/bash 

BACKUP_HOST="localhost"  
BACKUP_USER="root"  
BACKUP_PASS="root"  
BACKUP_DIR=/backup   
BACKUP_DBNAME="teaching" 
COPIES=5 
MYSQLDUMP="mysqldump"
TIMEPOINT=$(date -u +%Y-%m-%d.%H:%M:%S)
MYSQLDUMP_OPTS="-h $BACKUP_HOST -u$BACKUP_USER -p$BACKUP_PASS" 
umask 0077
test ! -d "$BACKUP_DIR" && mkdir -p "$BACKUP_DIR"  
test ! -w $BACKUP_DIR && echo "Error: $BACKUP_DIR is un-writeable." && exit 0   
for dbname in $BACKUP_DBNAME   
	do  
    	test ! -d "$BACKUP_DIR/$dbname" && mkdir -p "$BACKUP_DIR/$dbname"
        $MYSQLDUMP $MYSQLDUMP_OPTS $dbname | gzip > $BACKUP_DIR/$dbname/$dbname.$TIMEPOINT.sql.gz   
    done
find $BACKUP_DIR -type f -mtime +$COPIES -delete
