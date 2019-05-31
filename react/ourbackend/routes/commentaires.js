var comments_Controller = require('../Controllers/ControllerComment');
var comments_Model = require('../Models/ModelComment');

var express = require('express');
var router = express.Router();
var bodyParser = require('body-parser');

/* GET home page. */
router.get('/', comments_Controller.displayAllComments);
router.post('/', comments_Controller.postAllComments);

module.exports = router;
