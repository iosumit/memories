

const getMemories = (req, res, next) => {
    res.status(200).json({ status: 'Success', message: 'Memories Fetched' });
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