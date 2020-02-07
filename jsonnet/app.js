/*
Pull records from Airtable and dump ndjson to disk for processing in Jsonnet.
*/

// todo: (0) pre-test this script events base
// todo: (1) create a mock base with the appropriate schema 
// todo: (2) test this script 

const fs = require('fs');

const base = require('airtable').base('xxx');  // todo: add base id

base('Events').select({
  view: 'Prod Live'
})
.all()
.then(records => {
  const placeItems = [];
  records.forEach(item => {
    placeItems.push(item);
  });

  contents = placeItems.join('\n') + '\n';
  fs.writeFile('places.html', contents, function(err) {
    if (err) {
      return console.log(err);
    }
  });
})
.catch(err => {
  console.log('err=', err);
});
