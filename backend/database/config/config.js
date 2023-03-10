require("dotenv").config();

module.exports = {
  development: {
    host: process.env.HOSTNAME || process.env.MYSQL_HOST || "db",
    port: process.env.MYSQL_PORT || "3306",
    database: process.env.MYSQL_DATABASE || "e-commerce",
    username: process.env.MYSQL_USER || "root",
    password: process.env.MYSQL_PASSWORD || "password",
    dialect: "mysql",
  },
  production: {
    username: 'root',
    password: null,
    database: 'database_production',
    host: '127.0.0.1',
    dialect: 'mysql',
  },
};
