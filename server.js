const express = require('express');
const app = express();
const port = 2500;

app.use(express.static('public'));

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/public/index.html');
});

app.listen(port, () => {
  console.log(`Server running at http://16.112.189.57:${port}`);
});
