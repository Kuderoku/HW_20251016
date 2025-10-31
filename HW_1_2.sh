if [ -z "$1" ]; then
  echo "Ошибка: Не указано имя файла..."
  exit 1
fi
searchedFile="$1"
if [ -f "$searchedFile" ]; then
  echo "Файл '$searchedFile' найден."
else
  echo "Файл '$searchedFile' не найден."
fi