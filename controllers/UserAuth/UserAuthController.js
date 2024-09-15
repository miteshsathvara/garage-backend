const { AppDataSource } = require("../../config/appconfig.js");
const User = require("../../models/User.js");
const UserMobileVerification = require("../../models/UserMobileVerification.js");
const { validationResult } = require('express-validator');
const otpService = require('../../services/otpService.js');
const jwtTokenService = require('../../services/jwtTokenService.js');
const userRepository = AppDataSource.getRepository(User);
const userMobileVerificationRepository = AppDataSource.getRepository(UserMobileVerification);


exports.signUp = async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            const errormessage = errors.array().map(err => err.msg);
            return res.status(400).json({ errors: errormessage });
        }
        req.body.role = 1; // Assign User Role
        req.body.is_active = 1; // By Default user active

        const { first_name, last_name, mobile_no, role, is_active } = req.body;

        // Check if the mobile number is already registered
        const existingUser = await userRepository.findOneBy({ mobile_no });
        if (existingUser) {
            return res.status(400).json({ message: "Mobile number already registered" });
        }
        // User Creation
        const newUser = userRepository.create({ first_name, last_name, mobile_no, role, is_active });
        const newUserCreated = await userRepository.save(newUser);

        // generate OTP
        const otp = otpService.generateOTP();
        console.log('otp', otp);
        // OTP send after user creation
        const isOtpSend = await otpService.sendOTP(mobile_no, otp);
        // OTP send successfully then save into our database.
        if (isOtpSend.type == "success") {
            const user_id = newUserCreated.id;
            const newUserOTP = userMobileVerificationRepository.create({ user_id, otp });
            await userMobileVerificationRepository.save(newUserOTP);
        }

        res.status(201).json({ message: "User Registration successful.OTP send your mobile number.", user: newUser });

    } catch (error) {
        console.error("Error during sign-up:", error);
        res.status(500).json({ message: "An error occurred during sign-up" });
    }

};
exports.verifyOtp = async (req, res) => {

    const { mobile_no,otp } = req.body;
    const existingUser = await userRepository.findOneBy({ mobile_no });
    if (!existingUser) {
        return res.status(400).json({ message: "Mobile number not registered" });
    }
    if (existingUser.id) {
        var getUserData = await userMobileVerificationRepository
        .createQueryBuilder("user_mobile_verification") 
        .where("user_mobile_verification.user_id = :user_id", { user_id: existingUser.id })
        .getOne();
    }
    if(getUserData && getUserData.id) {
        console.log(getUserData);
        if(getUserData.otp == otp ){
            // Generate JWT Token
            const token = jwtTokenService.generateToken({existingUser });
            existingUser.token = token;
            res.status(201).json({ message: "OTP Verification Successfully.", user: existingUser });
        }else{
            res.status(404).json({ message: "OTP Verification Failed."});
        }
    }
}
exports.login = async (req, res) => {
    try {
        const { mobile_no } = req.body;

        // Check if the mobile number is already registered
        const existingUser = await userRepository.findOneBy({ mobile_no });
        if (!existingUser) {
            return res.status(400).json({ message: "Mobile number Not Registered." });
        }
    
        // generate OTP
        const otp = otpService.generateOTP();
        console.log('otp', otp);
        // OTP send after user creation
        const isOtpSend = await otpService.sendOTP(mobile_no, otp);
        // OTP send successfully then save into our database.
        if (existingUser && isOtpSend.type == "success") {
            const user_id = existingUser.id;
            const result = await userMobileVerificationRepository.delete({ user_id: user_id });
            const newUserOTP = userMobileVerificationRepository.create({ user_id, otp });
            await userMobileVerificationRepository.save(newUserOTP);
        }

        res.status(201).json({ message: "OTP send your mobile number."});

    } catch (error) {
        console.error("Error during login:", error);
        res.status(500).json({ message: "An error occurred during login" });
    }
}

exports.logOut = async (req, res) => {
    console.log('logout api here');
}
