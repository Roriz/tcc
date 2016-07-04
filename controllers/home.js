var path = require('path'),
  _ = require('lodash'),
  express = require('express'),
  passport = require('passport'),
  sqljs = require('sqljs'),
  fs = require('fs-extra');


var options = new sqljs.ParseOptions;

var Home = module.exports = function() {

  this.router = express.Router();

  this.router.get('/', function(req, res, next) {

    fs.readFile('db/seed.sql', 'utf8', function(err, data) {
      if (err) {
        return console.log(err);
      }
      data = data.split(/\n/g);
      var seed = [];
      _.each(data, function(line) {
        if (line && line.indexOf('-- ') == -1) {
          try {
            seed.push(sqljs.parse(line, undefined, options));
          } catch (err) {
            console && console.error && console.error(err);
          }
        }
      });

      res.render('index.html', {
        seed: seed,
        user: req.user,
        cssFiles: fs.readdirSync(path.resolve(__dirname, '..', 'public', 'stylesheets')),
        controllerFiles: fs.readdirSync(path.resolve(__dirname, '..', 'public', 'javascripts', 'controllers')),
        servicesFiles: fs.readdirSync(path.resolve(__dirname, '..', 'public', 'javascripts', 'services')),
        factoryFiles: fs.readdirSync(path.resolve(__dirname, '..', 'public', 'javascripts', 'factories')),
        directiveFiles: fs.readdirSync(path.resolve(__dirname, '..', 'public', 'javascripts', 'directives'))
      });
    });


  });

  return this.router;
};