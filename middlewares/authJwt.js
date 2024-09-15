const {verifyToken} = require('../services/jwtTokenService');

const authenticateToken = (req, res, next) => {
    const authHeader = req.headers['authorization'];
   // console.log('token',authHeader);
    const token = authHeader && authHeader.split(' ')[1]; // Bearer <token>

    if (token == null) return res.status(401).send({
        message: "Unauthorized!",
    });
    try {
        const user = verifyToken(token);
        console.log('user',user);
        req.user = user; 
        next();
    } catch (error) {
        res.sendStatus(403); // Forbidden
    }
};

module.exports = authenticateToken;
