const { DataSource } = require("typeorm");

const MysqlDataSource = new DataSource({
    type: "mysql",
    host: "localhost", // Replace with your MySQL host
    port: 3306, // Default MySQL port
    username: "root", 
    password: "root", 
    database: "e-garage", 
    entities: [
		require('../models/User')
    ],
    synchronize: true, // Auto-sync schema with the database, disable in production
    logging: false, // Enable logging for debugging, disable in production
});
module.exports = MysqlDataSource;
