const express = require("express");
const app = express();
const {AppDataSource} = require("./config/appconfig.js");
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
const dotenv = require('dotenv');
const cors = require("cors");
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(cookieParser());
app.use(cors());


// parse requests of content-type - application/json
app.use(express.json());

app.use(cookieParser())

// parse requests of content-type - application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: true }));

// model;
require("./config/appconfig.js");

// routes
app.use(require('./routes'));

// simple route
app.get("/", (req, res) => {
  res.status(200).send("API IS RUNNING");
});

AppDataSource.initialize()
  .then(() => {
    console.log("Database has been initialized!");
    // set port, listen for requests
    const PORT = process.env.PORT || 5050;
    app.listen(PORT, () => {
      console.log(`Server is running on port ${PORT}.`);
    });
  })
  .catch((err) => {
    console.error("Error during Data Source initialization:", err);
  });
