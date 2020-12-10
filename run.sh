## VARS
PATH_TO_PROJECT_FOLDER=$1 
RESULTS_FOLDER=$2

# remove cached analizo statistics
# Analizo only recalculates metrics if the files change
rm -rf ~/.cache/analizo/




# Calculate metrics and write them to file

./bin/analizo metrics $1 > ${RESULTS_FOLDER}full_results.txt

# Parse results
TOOL=$RESULTS_FOLDER npm start --prefix ../parser/

