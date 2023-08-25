const { Router } = require("express");
const memoriesController = require('../controllers/memories.controller')

const router = Router();

router.route('/').get(memoriesController.getMemories)
router.route('/new').post(memoriesController.addNewMemories)
router.route('/update').post(memoriesController.updateMemory)
router.route('/:id').delete(memoriesController.deleteMemory)

module.exports = router;