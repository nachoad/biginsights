## Copy all the files in the declare array on the folder specified on the call
## Separate each file on the array in one line.
## Use: copyfilesto.sh <destination-folder-name>

declare -a files=(
  file1.csv
  file2.csv
  file3.txt
  file4.txt
)

if [ ! -d ./$1 ];then
  mkdir $1
fi

for i in "${files[@]}"
do
  cp $i ./$1/$i
done
