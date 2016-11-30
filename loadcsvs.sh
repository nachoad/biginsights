######################################################################
## Loading all the csv files on a folder, into their BigSQL files 
######################################################################

for csvfile in *.csv
do
        ## f is a variable with the name of the file, without the extension
	f=${csvfile%%.*}

	## Deleting possible ddl files that already exists on the folder
        rm $f.ddl

	## Creating the load statement on a ddl file
	echo "Creating the $f.ddl file for the load on BigSQL..."
        echo "load hadoop using file url '/files/$csvfile' with source properties ('field.delimiter'='|','ignore.extra.fields'='false', 'date.time.format'='yyyyMMdd') into table ZWH.$f overwrite with load properties ('rejected.records.dir'='/tmp/rejected_records/$f.out','max.rejected.records'=0,'num.map.tasks'=8);" >> $f.ddl
	
	## Loading the data with JQSH
	echo "Loading the data of the $f table on BigSQL with JSQSH."
        /usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql -i $f.ddl > jsqsh-$f.out
	
	## Seeing the output
	echo "---------------"
	echo "JSQSH output of jsqsh-$f.out"
	cat jsqsh-$f.out
done
