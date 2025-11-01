RAM_MAX=80

CPU_USAGE=$(wmic cpu get loadpercentage | awk 'NR==2{print $1}')

RAM_TOTAL=$(($(wmic ComputerSystem get TotalPhysicalMemory | awk 'NR==2{print $1}')/1024/1024))
RAM_FREE=$(($(wmic OS get FreePhysicalMemory | awk 'NR==2{print $1}')/1024))
RAM_USAGE=$(((RAM_TOTAL-RAM_FREE) * 100 / RAM_TOTAL))

ROM_USAGE=$(wmic logicaldisk get size,freespace,caption)



echo "--- Мониторинг ресурсов ($HOSTNAME) ---"
echo "Загрузка CPU: $CPU_USAGE%"
echo "Использование RAM: $RAM_USAGE%"
echo "Использование дискового пространства"
echo -e "Имя диска\t\tСвободно места\t\tВсего места"
echo "$ROM_USAGE" | tail -n +2 | while IFS= read -r LINE; do

    NEW_LINE=""
    COUNTER=0

    echo "$LINE" | fmt -1 | head -n -2 | while IFS= read -r WORD; do
        if [[ "$WORD" =~ ^-?[0-9]+$ ]]; then
            NEW_WORD=$((WORD / 1024 / 1024 / 1024))
            NEW_LINE=$NEW_LINE$NEW_WORD$" Gb\t\t\t"
        else
            NEW_LINE=$WORD$"\t\t\t"
        fi
        ((COUNTER++))
        if [[ "$COUNTER" -eq 3 ]]; then
            echo -e $NEW_LINE
        fi
    done
done


if [ "$RAM_USAGE" -gt "$RAM_MAX" ]; then
    echo "ВНИМАНИЕ: Высокое использование RAM: $RAM_USAGE% (Предел: $RAM_MAX%)"
fi
