const axios = require('axios');
const Msg91APIKey = '430391ACakEYmRcjKh66e66a7cP1';
const template_id = '66e66fcbd6fc0561a5080285';

const generateOTP = () => {
    return '111111';//Math.floor(100000 + Math.random() * 900000); // Generate 6-digit OTP
};

const sendOTP = async(mobile_no,otp) => {
    const url = `https://api.msg91.com/api/v5/otp?authkey=${Msg91APIKey}&template_id=${template_id}&mobile=${mobile_no}&otp=${otp}&route=4`;
    try {
       // const response = await axios.get(url);
       // return response.data;
       return {type : "success"}
    } catch (error) {
        console.error("Error sending OTP:", error.response ? error.response.data : error.message);
        throw new Error("Failed to send OTP.");
    }
}

// Function to verify OTP
const verifyOTP = async (mobile_no, otp) => {
    const url = `https://api.msg91.com/api/v5/otp/verify?authkey=${Msg91APIKey}&mobile=${mobile_no}&otp=${otp}`;
    try {
        const response = await axios.post(url);
        console.log("send Otp response data",response.data);
        return response.data;
    } catch (error) {
        console.error("Error verifying OTP:", error.response ? error.response.data : error.message);
        throw new Error("Failed to verify OTP.");
    }
};

module.exports = {
    generateOTP,
    sendOTP,
    verifyOTP,
};