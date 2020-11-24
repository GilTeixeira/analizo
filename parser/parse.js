const fs = require('fs');
const papa = require('papaparse');
const file = fs.createReadStream('../full_results.txt');

var mapMetric = new Map();

papa.parse(file, {
    header: true,
    dynamicTyping: true,
    worker: true, // Don't bog down the main thread if its a big file
    step: function(result) {
	
	// if not in map, its 0
	var currVal = mapMetric.get(result.data.metric) || 0;

        var accumResult = result.data.time + currVal;
        mapMetric.set(result.data.metric, accumResult);
        //console.log(result);
    },
    complete: function(results, file) {
	// Sort Map
    	var mapAsc = new Map([...mapMetric.entries()].sort());
    	
    	console.log("Metric = time in microseconds (10^-6)\n");
        for (let [key, value] of mapAsc.entries()) {
            console.log(key + ' = ' + value)
          }
    }
});
