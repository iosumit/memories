const Config = {
    ENVIROMENT_TYPE: process.env.ENVIROMENT_TYPE || '',
    MONGO_URI: process.env.MONGO_URI,
    PORT: process.env.PORT || 8300,
    POSTHOOK_API_KEY: process.env.POSTHOOK_API_KEY,
    POSTHOOK_SIGNING_KEY: process.env.POSTHOOK_SIGNING_KEY,
    JWT_AUTH_TOKEN_SECRET: process.env.JWT_AUTH_TOKEN_SECRET || 'jwt',

    MAILGUN_DOMAIN: process.env.MAILGUN_DOMAIN,
    MAILGUN_KEY: process.env.MAILGUN_KEY,
    MAILGUN_MAIL: process.env.MAILGUN_MAIL,

    POSTHOOK_DOMAIN: process.env.POSTHOOK_DOMAIN,
    POSTHOOK_API_KEY: process.env.POSTHOOK_API_KEY,
    POSTHOOK_SIGNING_KEY: process.env.POSTHOOK_SIGNING_KEY,
}

module.exports = {
    Config
}