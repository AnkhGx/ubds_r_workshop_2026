input_files="$1"
num_lines="$2"

echo "Input Files are: $1"
echo "Showing first $num_lines lines"

wc -l $intput_files | sort -n | tail -n $num_lines
