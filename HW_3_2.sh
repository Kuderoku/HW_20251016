read -p "Введите число: " temporyNum
if (( $temporyNum < 0 )); then
        echo "Число $temporyNum отрицательное."
else
    i=0
    while [ $i -le $temporyNum ]; do
    echo $i
    i=$((i + 1))
    done
fi
