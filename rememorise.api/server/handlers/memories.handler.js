const Memory = require('../models/Memory')
const { strings } = require('../utils/strings')
const mailgun = require('mailgun-js');
const { Config } = require('../../config');

const getMemories = () => new Promise((resolve, reject) => {
    const query = {}
    getAllObjectByQuery({ query }, (err, result) => {
        if (err) {
            return reject(err)
        }
        return resolve(result);
    })
})

const addNewMemory = (input) => new Promise((resolve, reject) => {
    console.log(input);
    const memory = new Memory(input)
    memory.save()
        .then((res) => resolve(res))
        .catch(err => reject(err))
})

const updateMemory = (input) => new Promise((resolve, reject) => {
    console.log(input);
    Memory.findOneAndUpdate({
        _id: input._id
    }, input)
        .then((res) => resolve(res))
        .catch(err => reject(err))
})

const deleteMemory = (id) => new Promise((resolve, reject) => {
    Memory.deleteOne({
        _id: id
    })
        .then((res) => resolve(res))
        .catch(err => reject(err))
})

const getAndUpdateNotifyMemory = () => new Promise((resolve, reject) => {
    const query = { "notify": true }
    const data = { $set: { last_notified: Date.now() } }
    Memory.findOneAndUpdate(query, data, { new: true, sort: { 'last_notified': 1 } })
        .then((res) => resolve(res))
        .catch(err => reject(err))
})

const sendEmail = (email, subject, body) => new Promise((resolve, reject) => {
    const mg = mailgun({ domain: Config.MAILGUN_DOMAIN, apiKey: Config.MAILGUN_KEY });

    const data = {
        from: Config.MAILGUN_MAIL,
        to: email,
        subject: subject,
        text: body
    };

    mg.messages().send(data, (error, body) => {
        if (error) {
            reject({ message: 'Error:', error });
        } else {
            resolve({ message: 'Email sent:', body });
        };
    });

})

const createPosthook = (body) => new Promise((resolve, reject) => {
    var myHeaders = new Headers();
    myHeaders.append("X-API-Key", Config.POSTHOOK_API_KEY);
    myHeaders.append("Content-Type", "application/json");

    var raw = JSON.stringify(body);

    var requestOptions = {
        method: 'POST',
        headers: myHeaders,
        body: raw,
        redirect: 'follow'
    };

    fetch(`https://${Config.POSTHOOK_DOMAIN}/v1/hooks`, requestOptions)
        .then(response => response.json())
        .then(result => resolve(result))
        .catch(error => reject(error));
})

function getObjectByQuery(filters, next) {
    Memory.findOne(filters.query)
        .select(filters.selectFrom ? filters.selectFrom : {})
        .sort(filters.sortBy ?? {})
        .lean()
        .then((result) => next(null, result))
        .catch((err) => next(err));
}
function getAllObjectByQuery(filters, next) {
    Memory.find(filters.query ?? {})
        .select(filters.selectFrom ?? {})
        .sort(filters.sortBy ?? {})
        .lean()
        .then((result) => next(null, result))
        .catch((err) => next(err));
}

module.exports = {
    getMemories,
    addNewMemory,
    updateMemory,
    deleteMemory,
    getAndUpdateNotifyMemory,
    createPosthook,
    sendEmail
}