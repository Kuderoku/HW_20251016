filename="input.txt"

if [ -f "$filename" ]; then
  wc -l $filename &>> "output.txt"
else
  ls $filename 2>> "error.log"
fi
