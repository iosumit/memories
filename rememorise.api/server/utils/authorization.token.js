const jwt = require("jsonwebtoken");
const { strings } = require("./strings");
const async = require('async');
const { Config } = require("../../config");

function verifyApiAuth(req, res, next) {
    let model = {};
    async.series([
        cb => {
            if (!req.headers) return cb(strings.unauthorized_access)
            let token = req.headers.authorization;
            if (!token) return cb(strings.unauthorized_access)

            token = token.split(' ');
            if (token.length != 2) return cb(strings.unauthorized_access)
            verifyToken(token[1], (err, res) => {
                if (err) return cb(strings.unauthorized_access)
                model.user = res
                return cb()
            })
        }
    ], err => {
        if (err) {
            return res.status(403).json({
                status: strings.error,
                message: err
            })
        } else {
            req.user = model.user;
            next()
        }
    })
}
const verifyToken = (token, next) => {
    jwt.verify(token, Config.JWT_AUTH_TOKEN_SECRET, (err, res) => {
        if (err || !res) return next(err)
        return next(null, res)
    })
}
const createToken = (user) => jwt.sign(user, Config.JWT_AUTH_TOKEN_SECRET, {
    expiresIn: '7d'
})
module.exports = { verifyToken, createToken, verifyApiAuth }