helloFunction() {
  local input_string="$1"
  echo "Hello, $input_string"
}
addFunction() {

  sum=$(( $1 + $2 ))
  echo "Сумма: $sum"
}

read -p "Введите строку: " temporyString
helloFunction $temporyString
read -p "Введите первое число: " temporyNum1
read -p "Введите второе число: " temporyNum2
addFunction $temporyNum1 $temporyNum2
