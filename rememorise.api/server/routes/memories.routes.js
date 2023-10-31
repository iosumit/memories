const { Router } = require("express");
const memoriesController = require('../controllers/memories.controller')

const router = Router();

router.route('/').get(memoriesController.getMemories)
router.route('/new').post(memoriesController.addNewMemories)
router.route('/update').put(memoriesController.updateMemory)
router.route('/:id').delete(memoriesController.deleteMemory)
router.route('/webhook').post(memoriesController.memoryHook)

module.exports = router;