#!/bin/bash

# MySQL check command
/usr/local/mysql/bin/mysqlcheck --all-databases --check-only-changed --silent

# Current date for backup filenames
backup_date=$(date +%Y%m%d%H%M%S)

# Backup directory paths
backup_dir1="/mnt/sqlTank1"
backup_dir2="/mnt/sqlTank2"

# MySQL credentials
mysql_user="your_mysql_user"
mysql_password="your_mysql_password"

# Text backup
text_backup_dir="$backup_dir1/text_backup_$backup_date"
mkdir -p "$text_backup_dir"
mysqldump -u "$mysql_user" -p"$mysql_password" --all-databases > "$text_backup_dir/all_databases.sql"

# Binary backup
binary_backup_dir="$backup_dir2/binary_backup_$backup_date"
mkdir -p "$binary_backup_dir"
/usr/local/mysql/bin/mysqldump -u "$mysql_user" -p"$mysql_password" --all-databases --single-transaction --quick --lock-tables=false --routines --events --triggers --hex-blob --result-file="$binary_backup_dir/all_databases.sql"

echo "Backups completed!"
