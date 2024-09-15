const { body } = require('express-validator');

const userSignupValidation = () => [
    body('first_name').notEmpty().isString().withMessage('First name is required'),
    body('last_name').notEmpty().isString().withMessage('Last name is required'),
    body('mobile_no')
        .notEmpty().withMessage('Mobile number is required')
        .isMobilePhone().withMessage('Mobile number is invalid').custom((value) => {
            if (value.length !== 10) {
                return Promise.reject("Phone number should be 10 digits");
            } else {
                return true;
            }
        }),
];

const garageUserSignupValidation = () => [
    body('first_name').notEmpty().isString().withMessage('First name is required'),
    body('last_name').notEmpty().isString().withMessage('Last name is required'),
    body('owner_name').notEmpty().isString().withMessage('Owner Name is required.'),
    body('garage_name').notEmpty().isString().withMessage('Garage Name is required.'),
    body('mobile_no')
        .notEmpty().withMessage('Mobile number is required')
        .isMobilePhone().withMessage('Mobile number is invalid').custom((value) => {
            if (value.length !== 10) {
                return Promise.reject("Phone number should be 10 digits");
            } else {
                return true;
            }
        }),
    body('street_address').notEmpty().isString().withMessage('Garage Address is required.'),
    body('state').notEmpty().isString().withMessage('State is required.'),
    body('city').notEmpty().isString().withMessage('City is required.'),
    body('zipcode').notEmpty().withMessage('Zipcode is required.'),
]

module.exports = { userSignupValidation,garageUserSignupValidation };