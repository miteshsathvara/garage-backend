const router = require('express').Router();
const UserController = require('../../controllers/UserController');

// For User flow
router.post('/signUp', UserController.signUp);
router.get('/login', UserController.login);
router.post('/logout', UserController.logOut);

module.exports = router;