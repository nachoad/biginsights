######################################################################
## Create the analyze-all-tables.sql file to launch the ANALYZE
## statement for all the tables.
######################################################################

for csvfile in *.csv
do
  ## f is a variable with the name of the file, without the extension
  f=${csvfile%%.*}

  echo "ANALYZE TABLE ZWH.$f COMPUTE STATISTICS FULL FOR ALL COLUMNS;" >> analyze-all-tables.sql

done
