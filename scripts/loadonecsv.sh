########################################################
## Loading one csv file given in the call, into a BigSQL table
## Use: ./loadonecsv.sh <CSV-TO-LOAD>
#########################################################

csvfile=$1

## f is a variable with the name of the file, without the extension
f=${csvfile%%.*}

## Deleting possible ddl files that already exists on the folder
if [ ! -d ./ddl ];then
  mkdir ddl
fi
if [ ! -d ./out ];then
  mkdir out
fi
if [ -f ./ddl/$f.ddl ]; then
	rm ./ddl/$f.ddl
fi
if [ -f ./out/jsqsh-$f.out ];then
	rm ./out/jsqsh-$f.out
fi

## Creating the load statement on a ddl file
echo -e "\n@@@@@@@@@@@@@@@"
echo "Creating the $f.ddl file for the load on BigSQL..."
echo "load hadoop using file url '/files/$csvfile' with source properties ('field.delimiter'='|','ignore.extra.fields'='false', 'date.time.format'='yyyyMMdd','date.time.format'='yyyy-MM-dd-HH.mm.ss.SSSSSS') into table ZWH.$f overwrite with load properties ('rejected.records.dir'='/tmp/rejected_records/$f.out','max.rejected.records'=0,'num.map.tasks'=8);" >> ./ddl/$f.ddl

## Loading the data with JQSH
echo "Loading the data of the $f table on BigSQL with JSQSH."
/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql -i ./ddl/$f.ddl 2> ./out/jsqsh-$f.out

## Seeing the output
echo "---- JSQSH output of jsqsh-$f.out: ----"
cat ./out/jsqsh-$f.out
