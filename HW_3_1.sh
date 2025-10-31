read -p "Введите число: " temporyNum

if (( $temporyNum > 0 )); then
  echo "Число $temporyNum положительное."
else
    if (( $temporyNum < 0 )); then
        echo "Число $temporyNum отрицательное."
    else
        echo "Число $temporyNum является нулём."
    fi
fi
