filename="input.txt"

if [ -f "$filename" ]; then
    while read -r line
        do
            # Действия с каждой строкой, например, вывод
            echo "$line"
        done < "$filename"
    wc -l $filename &>> "output.txt"
else
    ls $filename 2>> "error.log"
fi
