var search_controller = require('../Controllers/ControllerSearch');
var Search = require('../Models/ModelSearch');

var express = require('express');
var router = express.Router();

//get data using expess router AND a method defined in the Controller
router.get('/', search_controller.displaythesearch);

//export router to app.js
module.exports = router;
