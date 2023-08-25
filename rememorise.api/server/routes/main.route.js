const { Router } = require("express");
const { Config } = require('../../config');
const { strings } = require("../utils/strings");
const { version } = require('../../package.json');

const router = Router()

router.route('/').get((req, res) => {
    res.status(200);
    res.json({
        status: strings.success,
        message: strings.server_is_working,
        env: Config.ENVIROMENT_TYPE,
        version: `${version}`,
    });
});

module.exports = router