const router = require('express').Router();
const GarageAuthController = require('../../controllers/GarageAuth/GarageAuthController');
const { garageUserSignupValidation } = require('../../validations/user.validation');
const authenticateToken = require('../../middlewares/authJwt');

// For Garage flow
router.post('/garage_signup',garageUserSignupValidation(), GarageAuthController.garageSignup);

// For making changes in the garage details.
// Protected routes
router.post('/garage_details_update', authenticateToken, GarageAuthController.updateDetails);

module.exports = router;