const express = require('express');
const routes = require('./routes');
const cors = require('cors');


const app = express();

app.use(cors());
app.use(express.json());
app.use('/images', express.static(__dirname + '/images'))

app.use(routes);

app.listen(3333);