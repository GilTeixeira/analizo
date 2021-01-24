## VARS
PATH_TO_PROJECT_FOLDER=$1 
RESULTS_FOLDER=$2
TOOLS_TIME_FILE=$3

# remove cached analizo statistics
# Analizo only recalculates metrics if the files change
rm -rf ~/.cache/analizo/




# Calculate metrics and write them to file

start=`date +%s%N`
./bin/analizo metrics $1 > ${RESULTS_FOLDER}class_results.csv
end=`date +%s%N`

echo "analizo;`expr $end - $start`">>$TOOLS_TIME_FILE


# Parse results
RES_PATH=$RESULTS_FOLDER npm start --prefix ../parser/

