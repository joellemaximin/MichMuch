var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var bodyParser = require('body-parser');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var filmsRouter = require('./routes/films');
var commentsRouter = require('./routes/commentaires');
var contactRouter = require('./routes/contact');
var searchRouter = require('./routes/search');

// var adminMovies = require('./routes/admin/adminMovies')
var app = express();



// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/films', filmsRouter);
app.use('/film/id', filmsRouter);
app.use('/comments', commentsRouter);
app.use('/contact', contactRouter);
app.use('/search', searchRouter);

// app.use('/adminlistMovies', adminMovies);
// app.use('/addMovies', adminAddMovies);
// app.use('/editMovie', adminEditMovies);
// app.use('/addContacts', adminAddContacts);
// app.use('/editContact', adminEditContacts);
// app.use('/adminlistComments', adminComments);
// app.use('/editContact ', adminEditContacts);
// app.use('/editContact', adminEditContacts);



app.use( bodyParser.json() );       // to support JSON-encoded bodies
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
  extended: true
})); 

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
