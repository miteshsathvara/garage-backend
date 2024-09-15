const router = require('express').Router();
const UserAuthController = require('../../controllers/UserAuth/UserAuthController');
const { userSignupValidation } = require('../../validations/user.validation');
const authenticateToken = require('../../middlewares/authJwt');
// For User flow
// Public Routes
router.post('/signup', userSignupValidation(), UserAuthController.signUp);
router.post('/verify_otp', UserAuthController.verifyOtp);
router.post('/login', UserAuthController.login);

// Protected routes
router.post('/logout',authenticateToken, UserAuthController.logOut);

module.exports = router;