var mysql = require('mysql')


var connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'ajlogbook'
});




module.exports = connection ;