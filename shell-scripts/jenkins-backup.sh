#!/bin/bash

JENKINS_HOME="/var/lib/jenkins"
BACKUP_DIR="/backup/jenkins"
DATE=$(date +%F)

echo "Starting Jenkins backup..."

mkdir -p $BACKUP_DIR

tar -czvf $BACKUP_DIR/jenkins_backup_$DATE.tar.gz $JENKINS_HOME

echo "Backup completed successfully"
echo "Backup file: $BACKUP_DIR/jenkins_backup_$DATE.tar.gz"
