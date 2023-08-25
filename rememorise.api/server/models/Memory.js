const mongoose = require('mongoose')

const memorySchema = mongoose.Schema({
    email: String,
    subject: String,
    description: String,
    tags: [String],
    image: String,
    notify: {
        type: Boolean,
        default: false
    },
    isDeleted: {
        type: Boolean,
        default: false
    },
    last_notified: {
        type: Date,
        default: Date.now
    },
},
    {
        timestamps: true
    })

module.exports = mongoose.model('Memories', memorySchema)