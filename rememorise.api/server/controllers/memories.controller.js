
const Joi = require('joi');
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

const addNewMemories = (req, res, next) => {
    if (!req.body) {
        res.status(500).json({ status: strings.error, message: strings.param_not_found });
    }

    const schema = Joi.object({
        email: Joi.string().email().required(),
        subject: Joi.string()
            .min(3).max(40)
            .required(),
        description: Joi.string()
            .min(3)
            .required(),
        tags: Joi.array(),
        image: Joi.string(),
        notify: Joi.bool(),
    }).unknown(false)

    const joires = schema.validate(req.body)
    if (joires.error) {
        return res.status(502).json({ status: strings.error, message: joires.error.details[0].message })
    }

    handler.addNewMemory(req.body).then((result) => {
        res.status(200).json({ status: strings.success, message: 'Successfully added', data: result ?? [] });
    }).catch(err => {
        res.status(500).json({ status: strings.error, message: strings.error_message });
    })
}

const updateMemory = (req, res, next) => {
    if (!req.body) {
        res.status(500).json({ status: strings.error, message: strings.param_not_found });
    }

    const schema = Joi.object({
        _id: Joi.string().required(),
        email: Joi.string().email().required(),
        subject: Joi.string()
            .min(3).max(40)
            .required(),
        description: Joi.string()
            .min(3)
            .required(),
        tags: Joi.array(),
        image: Joi.string(),
        notify: Joi.bool(),
    }).unknown(false)

    const joires = schema.validate(req.body)
    if (joires.error) {
        return res.status(502).json({ status: strings.error, message: joires.error.details[0].message })
    }

    handler.updateMemory(req.body).then((result) => {
        res.status(200).json({ status: strings.success, message: 'Successfully updated', data: result });
    }).catch(err => {
        console.log(err)
        res.status(500).json({ status: strings.error, message: strings.error_message });
    })
}

const deleteMemory = (req, res, next) => {
    res.status(200).json({ status: 'Success', message: 'Memory Deleted' });
}

module.exports = {
    getMemories, deleteMemory, addNewMemories, updateMemory
}