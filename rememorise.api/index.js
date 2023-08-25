require('dotenv').config();
const { createServer } = require("http");
const app = require("./server/app");
const { Config } = require("./config");

const server = createServer(app)

module.exports = server.listen(Config.PORT, () => console.log("Server listening on PORT", Config.PORT))