//Set up default database connection
const mysql = require('mysql');

const connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: '1234',
	database: 'cinema'
});

exports.connect = connection.connect(function(err){
	if(err){
		console.log('error' + err.stack);
		return;
	}

	console.log('connextion as id' + connection.threadId);
});

module.exports = connection;