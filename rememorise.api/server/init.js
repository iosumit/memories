const mongoose = require('mongoose')
const { Config } = require('../config');

async function run() {
    try {
        console.log("Pinging to MongoDB!");
        await mongoose.connect(Config.MONGO_URI, { useNewUrlParser: true, dbName: 'memories' }).then(() => console.log("Pinged your deployment. You successfully connected to MongoDB!")).catch(e => console.log("DB connection failed", e));
    } finally {

    }
}
module.exports = run().catch("Failed", console.dir);