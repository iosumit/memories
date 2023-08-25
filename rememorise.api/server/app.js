const Express = require("express");
const cors = require('cors');
const morgan = require('morgan');
const bodyParser = require('body-parser');

const app = new Express();

app.use(cors({
    origin: '*'
}));
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())
app.use(morgan('dev'))


const mainRoutes = require("./routes/main.route");
const memoriesRoutes = require("./routes/memories.routes");

app.use('/', mainRoutes)
app.use('/memories', memoriesRoutes)

module.exports = app;