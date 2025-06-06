const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => res.send('hi!'));

if (require.main === module) {
  app.listen(port, () => console.log(`listening on port ${port}`));
}

module.exports = app;
