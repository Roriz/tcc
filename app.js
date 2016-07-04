var path = require('path'),
  _ = require('lodash'),
  fs = require('fs-extra'),
  passport = require('passport');

var args = _.map(process.argv, function(val) {
  return val;
});

// Simple route middleware to ensure user is authenticated.
function ensureAuthenticated(req, res, next) {
  if (req.originalUrl.indexOf('images') != -1 || req.originalUrl.indexOf('stylesheets') != -1 || req.isAuthenticated()) {
    return next();
  }
  req.session.error = 'Please sign in!';
  res.redirect('/auth');
}

function startRouters(app) {

  fs.readdirSync(path.resolve(__dirname, 'controllers'))
    .filter(function(file) {
      return !_.startsWith(file, '.') && _.endsWith(file, '.js');
    })
    .forEach(function(file) {
      var rout = require(path.resolve(__dirname, 'controllers', file));
      rout = rout();

      var controllerName = file.replace('.js', '');
      if (controllerName == 'auth') {
        app.use('/' + (controllerName == 'home' ? '' : controllerName), rout);
      } else {
        app.use('/' + (controllerName == 'home' ? '' : controllerName), ensureAuthenticated, rout);
      }
    });

}

function initApp() {
  var express = require('express');
  var logger = require('morgan');
  var cookieParser = require('cookie-parser');
  var methodOverride = require('method-override');
  var bodyParser = require('body-parser');
  var app = express();
  var http = require('http');
  var multipart = require('connect-multiparty');
  var flash = require('connect-flash');

  var port = 3001;

  var LocalStrategy = require('passport-local').Strategy;
  var session = require('express-session');

  console.log('All Okay! Connection models initialized.');

  // view engine setup
  app.engine('html', require('ejs').renderFile);
  app.set('view engine', 'html');

  // uncomment after placing your favicon in /public
  // app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
  app.use(logger('dev'));
  app.use(flash());
  app.use(cookieParser());
  app.use(bodyParser.urlencoded({
    extended: false,
    limit: '50MB'
  }));
  app.use(bodyParser.json({
    limit: '50MB'
  }));


  app.use(methodOverride('X-HTTP-Method-Override'));

  app.use(session({
    secret: 'superstartup',
    resave: true,
    saveUninitialized: true,
    maxAge: new Date(Date.now() + 3600000),
  }));

  // passport.initialize
  app.use(passport.initialize());
  app.use(passport.session());

  //Multiparty
  app.use(multipart({
    uploadDir: 'temp/',
    maxFilesSize: '50MB'
  }));

  app.set('port', port);

  var server = app.listen(port, function() {
    console.log('Main Server Started listen in port:', port);
  });


  passport.serializeUser(function(user, done) {
    done(null, user);
  });

  passport.deserializeUser(function(user, done) {
    done(null, user);
  });

  passport.use("local", new LocalStrategy(
    function(username, password, done) {
      console.log("LOCAL STRATEGY BEFORE", username, password, done);
      if (username && password && username == 'admin' && password == 'admin') {
        return done(null, {
          name: 'Admin',
          email: 'admin@gmail.com',
          type: 1
        });
      } else if (username && password && username == 'gest' && password == 'gest') {
        return done(null, {
          name: 'Convidado',
          email: 'convidado@licagro.com.br',
          type: 2
        });
      } else {
        return done({
          user_not_found: true
        }, false);
      }
    }
  ));

  startRouters(app);

  app.use(express.static(path.join(__dirname, 'public')));

  // catch 404 and forward to error handler
  app.use(function(req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    console.log(err);
    next(err);
  });
  // error handlers

  // production error handler
  // no stacktraces leaked to user
  app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    console.log(err);
    res.render('error', {
      message: err.message,
      error: err
    });
  });


}

initApp();