filename="input.txt"

if [ -f "$filename" ]; then
    while read -r line
        do
            echo "$line"
        done < "$filename"
    wc -l $filename &>> "output.txt"
else
    ls $filename 2>> "error.log"
fi
