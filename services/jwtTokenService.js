const jwt = require('jsonwebtoken');

const secretKey = 'egarage-secret-key'; // Replace with your secret key

const generateToken = (user) => {
    return jwt.sign({ id: user.id, mobile_no: user.mobile_no }, secretKey, { expiresIn: '24h' });
};

const verifyToken = (token) => {
    try {
        return jwt.verify(token, secretKey);
    } catch (error) {
        throw new Error('Invalid token');
    }
};

module.exports = {
    generateToken,
    verifyToken
};
