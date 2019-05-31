var Comments = require('../Models/ModelComment');

exports.displayAllComments = function(req, res){

	Comments.getAllComments(function(err, data){
		if (err){
            res.send(err);
        } else {
            res.json(data)
        }
	});
};	

exports.postAllComments = function(req, res){
	const Comments = new Comments(req.body);
	
	// console.log(JSON.stringify(req.body));

       // console.log('req.body.name', req.body['name']);
    
    Comments.postComments(function(err, data){
		if (err){
            res.send(err);
        } else {
            res.json(data)
        }
	});
};