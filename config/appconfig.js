var typeorm = require('typeorm');
const UserSchema = require('../models/User.js');

const AppDataSource = new typeorm.DataSource({
  type: "mysql",
  host: "localhost", // Replace with your MySQL host
  port: 3306, // Default MySQL port
  username: "root",
  password: "root",
  database: "e-garage",
  entities: [
    require('../models/User'),
    require('../models/UserMobileVerification'),
  ],
  synchronize: true, // Auto-sync schema with the database, disable in production
  logging: false, // Enable logging for debugging, disable in production
});
AppDataSource.initialize().then(function() {
  console.log("Database has been initialized!");
}).catch(function(error){
  console.log("Error :",error)
});
module.exports = { AppDataSource };
