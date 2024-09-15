const router = require('express').Router();
const UserAuthController = require('../../controllers/UserAuth/UserAuthController');
const { userSignupValidation } = require('../../validations/user.validation');
// For User flow

router.post('/signup', userSignupValidation(), UserAuthController.signUp);
router.post('/verify_otp', UserAuthController.verifyOtp);
router.post('/login', UserAuthController.login);
router.post('/logout', UserAuthController.logOut);

module.exports = router;