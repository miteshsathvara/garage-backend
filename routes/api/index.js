const router = require('express').Router();

router.use('/', require('./userAuthRouter'));
router.use('/', require('./garageAuthRouter'));

module.exports = router;