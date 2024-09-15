const router = require('express').Router();
const GarageAuthController = require('../../controllers/GarageAuth/GarageAuthController');
const { garageUserSignupValidation } = require('../../validations/user.validation');

// For Garage flow
router.post('/garage_signup',garageUserSignupValidation(), GarageAuthController.garageSignup);

module.exports = router;