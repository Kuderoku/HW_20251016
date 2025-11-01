START_TIME=$(date +"%Y-%m-%d_%H-%M-%S")
SOURCE_DIR=$(pwd)
BACKUP_DIR=$(pwd | sed 's/\/[^\/]*$//')$"/"$(pwd | sed 's/.*\///')$"___"$START_TIME
COUNTER=0
mkdir -p "$BACKUP_DIR"
TEMPORY_MESSEGE=$(date +"%Y-%m-%d_%H-%M-%S")$"Процедура резеврного копирования начата: "$START_TIME
echo $TEMPORY_MESSEGE
echo $TEMPORY_MESSEGE >> "$BACKUP_DIR"$"/backub.log"
for file in "$SOURCE_DIR"/*; do
    if [ -f "$file" ]; then
        SOURCE_FILE_NAME=$(basename "$file")
        BACKUP_FILE_NAME=$START_TIME$"___"$SOURCE_FILE_NAME
        cp "$file" "$BACKUP_DIR/$BACKUP_FILE_NAME"
        TEMPORY_MESSEGE=$(date +"%Y-%m-%d_%H-%M-%S")$":\t"$SOURCE_FILE_NAME$"\t->\t"$BACKUP_FILE_NAME
        echo -e $TEMPORY_MESSEGE
        echo -e $TEMPORY_MESSEGE >> "$BACKUP_DIR"$"/backub.log"
        COUNTER=$(($COUNTER+1))
    fi
done
TEMPORY_MESSEGE=$"Процедура резеврного копирования завершена: "$(date +"%Y-%m-%d_%H-%M-%S")$",  скопировано "$COUNTER$" объект(а/ов)"
echo $TEMPORY_MESSEGE
echo $TEMPORY_MESSEGE >> "$BACKUP_DIR"$"/backub.log"
