const Memory = require('../models/Memory')
const { strings } = require('../utils/strings')

const getMemories = () => new Promise((resolve, reject) => {
    const query = {}
    getObjectByQuery({ query }, (err, result) => {
        if (err) {
            return reject(err)
        }
        return resolve(result);
    })
})

function getObjectByQuery(filters, next) {
    Memory.findOne(filters.query)
        .select(filters.selectFrom ? filters.selectFrom : {})
        .lean()
        .then((result) => next(null, result))
        .catch((err) => next(err));
}

module.exports = {
    getMemories
}