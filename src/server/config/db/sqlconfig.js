const mysql = require('mysql');
const db = mysql.createConnection({ 
  host : 'localhost', 
  // port: '88',
  user : 'root', 
  password : '',
  database : 'ecommerce1',
  multipleStatements: true
});

module.exports = db;