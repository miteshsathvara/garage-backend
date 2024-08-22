const router = require('express').Router();
const AuthController = require('../../controllers/AuthController');

router.post('/signUp', AuthController.signUp);
router.get('/login', AuthController.login);
router.post('/logout', AuthController.logOut);

module.exports = router;