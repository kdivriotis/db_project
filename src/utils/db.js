const mysql = require("mysql2");
const {
  dbDatabase,
  dbHost,
  dbPort,
  dbUser,
  dbPassword,
} = require("../config/db");

const poolNoPromise = mysql.createPool({
  host: dbHost,
  port: dbPort,
  user: dbUser,
  password: dbPassword,
  database: dbDatabase,
  waitForConnections: true,
  connectionLimit: 20,
  queueLimit: 0,
});

module.exports.pool = poolNoPromise.promise();
