const mysql = require("mysql2");
const { dbDatabase, dbHost, dbUser, dbPassword } = require("../config/db");

const poolNoPromise = mysql.createPool({
  host: dbHost,
  user: dbUser,
  password: dbPassword,
  database: dbDatabase,
  waitForConnections: true,
  connectionLimit: 20,
  queueLimit: 0,
});

module.exports.pool = poolNoPromise.promise();
