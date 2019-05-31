//model require database connection;
var sql = require('./db.js');

//define an object contructor
var Search = function(data){
	this.id = data.id;
}

//define object method to be used by controller
Search.getAllSearch = function(result){
	sql.query('SELECT movie_name from movies WHERE movie_name LIKE "?%" ', function(err,res, fields){
		if(err) throw err;
		result(null, res);
	});
};


//export object to controller
module.exports = Search;