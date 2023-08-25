
const handler = require('../handlers/memories.handler');
const { strings } = require('../utils/strings');

const getMemories = (req, res, next) => {
    handler.getMemories().then((result) => {
        res.status(200).json({ status: strings.success, message: 'Successfully memories fetched', data: result ?? [] });
    }).catch(err => {
        console.log(err)
        res.status(500).json({ status: strings.error, message: strings.error_message });
    })
}

const addNewMemory = (req, res, next) => {
    res.status(200).json({ status: 'Success', message: 'New Memory Added' });
}

const updateMemory = (req, res, next) => {
    res.status(200).json({ status: 'Success', message: 'Memory Updated' });
}

const deleteMemory = (req, res, next) => {
    res.status(200).json({ status: 'Success', message: 'Memory Deleted' });
}

module.exports = {
    getMemories, deleteMemory, addNewMemory, updateMemory
}