const fs = require('fs');

const base = require('airtable').base('appjTpHU0SpGT0TCe');

base('Events').select({
  view: 'Prod Live'
})
.all()
.then(records => {
  const eventItems = [];
  records.forEach(item => {
    const eventItem = `
    <tr data-pk="${item.fields.PK}">
      <td>${item.fields.Date} <span>${item.fields.Time}</span></td>
      <td><a href="${item.fields.URL}" target="_blank" rel="noopener">${item.fields.Title}</a></td>
      <td>${item.fields.Notes || ''}</td>
    </tr>`;
    eventItems.push(eventItem);
  });

  const eventItemsStr = eventItems.join('  ');

  filename = 'output.html';
  contents = eventItemsStr + '\n';
  fs.writeFile(filename, contents, function(err) {
    if (err) {
      return console.log(err);
    }
  });
})
.catch(err => {
  console.log('err=', err);
});
