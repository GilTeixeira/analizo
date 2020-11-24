# remove cached analizo statistics
# Analizo only recalculates metrics if the files change
rm -rf ~/.cache/analizo/

# Calculate metrics and write them to dile
./bin/analizo metrics $1 > full_results.txt

# Parse results
npm start --prefix ./parser/