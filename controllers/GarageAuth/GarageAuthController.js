
const { AppDataSource } = require("../../config/appconfig.js");
const User = require("../../models/User.js");
const UserAddressDetails = require("../../models/UserAddressDetails.js");
const UserMobileVerification = require("../../models/UserMobileVerification.js");
const { validationResult } = require('express-validator');
const otpService = require('../../services/otpService.js');
const userRepository = AppDataSource.getRepository(User);
const userAddressDetailsRepository = AppDataSource.getRepository(UserAddressDetails);
const userMobileVerificationRepository = AppDataSource.getRepository(UserMobileVerification);


exports.garageSignup = async (req, res) => {
    console.log('garage signup');
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            const errormessage = errors.array().map(err => err.msg);
            return res.status(400).json({ errors: errormessage });
        }
        req.body.role = 2; // Assign User Role
        req.body.is_active = 1; // By Default user active

        const { first_name, last_name, mobile_no, role, is_active,owner_name,garage_name,street_address,state,city,zipcode } = req.body;

        // Check if the mobile number is already registered
        const existingUser = await userRepository.findOneBy({ mobile_no });
        if (existingUser) {
            return res.status(400).json({ message: "Mobile number already registered" });
        }
        // User Creation
        const newUser = userRepository.create({ first_name, last_name, mobile_no, role, is_active });
        const newUserCreated = await userRepository.save(newUser);

        // Once New User Created then add more detail in address table
        if (newUserCreated) {
            const user_id = newUserCreated.id;
            const newUserAddressDetails =   userAddressDetailsRepository.create({
                user_id,
                owner_name,
                garage_name,
                street_address,
                state,
                city,
                zipcode
            })
            const newUserAddressDetailsCreated = await userAddressDetailsRepository.save(newUserAddressDetails);
        }

        // generate OTP
        const otp = otpService.generateOTP();
        console.log('otp', otp);
        // OTP send after user creation
        const isOtpSend = await otpService.sendOTP(mobile_no, otp);
        // OTP send successfully then save into our database.
        if (isOtpSend.type == "success") {
            const user_id = newUserCreated.id;
            const result = await userMobileVerificationRepository.delete({ user_id: user_id });
            const newUserOTP = userMobileVerificationRepository.create({ user_id, otp });
            await userMobileVerificationRepository.save(newUserOTP);
        }

        res.status(201).json({ message: "Garage Registration successful.OTP send your mobile number.", user: newUser });

    } catch (error) {
        console.error("Error during Garage sign-up:", error);
        res.status(500).json({ message: "An error occurred during Garage sign-up" });
    }
};
exports.verifyOtp = async (req, res) => {
    //

}
exports.login = async (req, res) => {
}

exports.logOut = async (req, res) => {

}
