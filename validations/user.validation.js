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
]

module.exports = { userSignupValidation };