
SOURCE="/c/Users/JD"
DEST="/c/Users/JD/Backups"
mkdir -p "$DEST"
FILENAME="home_backup_$(date +%F_%H-%M-%S).tar.gz"
tar -czf "$DEST/$FILENAME" -C "$SOURCE" .
find "$DEST" -type f -name "home_backup_*.tar.gz" -mtime +7 -exec rm {} \;
echo "Backup completed: $FILENAME"

