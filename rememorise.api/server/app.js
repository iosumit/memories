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


app.use('/', (req, res, next) => {
    res.status(200).json({ status: "Success", message: "Server is working" })
})

module.exports = app;