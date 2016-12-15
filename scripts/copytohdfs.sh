##############################################
## Copy to HDFS
##############################################

if [ $# -ne 1 ]; then
  echo "Input file needed. You have to enter a parameter to the script";
  # Exit
  exit 64
fi

csvfile=$1
f=${csvfile%%.*}

echo -e "\n@@@@@@@@@@@@@@@"
echo "@@@ Deleting the HDFS file:"
hdfs dfs -rm /files/$f.csv
echo "@@@ Copying the new file to HDFS:"
hdfs dfs -put $f.csv /files/$f.csv
echo -e "@@@ Done.\n"
