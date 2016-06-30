var path = require('path'),
  express = require('express'),
  passport = require('passport'),
  fs = require('fs-extra');

var Home = module.exports = function() {

  this.router = express.Router();

  this.router.get('/', function(req, res, next) {

    res.render('index.html', {
      user: req.user,
      cssFiles: fs.readdirSync(path.resolve(__dirname, '..', 'public', 'stylesheets')),
      controllerFiles: fs.readdirSync(path.resolve(__dirname, '..', 'public', 'javascripts', 'controllers')),
      factoryFiles: fs.readdirSync(path.resolve(__dirname, '..', 'public', 'javascripts', 'factories')),
      directiveFiles: fs.readdirSync(path.resolve(__dirname, '..', 'public', 'javascripts', 'directives'))
    });

  });

  return this.router;
};