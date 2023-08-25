const Config = {
    ENVIROMENT_TYPE: process.env.ENVIROMENT_TYPE || '',
    MONGO_URI: process.env.MONGO_URI,
    PORT: process.env.PORT || 8300
}

module.exports = {
    Config
}