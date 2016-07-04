var express = require('express'),
  passport = require('passport'),
  _ = require('lodash');


var Home = module.exports = function() {

  this.router = express.Router();

  this.router.get('/', function(req, res, next) {
    res.render('login.html', {}, function(err, html) {
      res.render('login.html');
    });
  });

  this.router.post('/ajax', function(req, res, next) {
    passport.authenticate('local', function(err, user, info) {
      console.log('/ajax');
      console.log(user);
      if (err) {
        res.json(err);
        return false;
      }
      if (!user) {
        res.json(info);
        return false;
      }
      req.logIn(user, function(err) {
        if (err) {
          res.json(err);
          return false;
        }
        res.json(user);
      });
    })(req, res, next);
  });

  this.router.post('/', function(req, res, next) {
    passport.authenticate('local', function(err, user, info) {
      if (err) {
        return next(err);
      }
      if (!user) {
        if (info && info.invalidAttributes) {
          if (info.invalidAttributes.is_operational) {
            return res.redirect('/auth?error=2');
          } else {
            return res.redirect('/auth?error=1');
          }
        }
      }
      req.logIn(user, function(err) {
        if (err) {
          return next(err);
        }
        return res.redirect('/');
      });
    })(req, res, next);
  });

  this.router.get('/logout', function(req, res) {
    var name = req.user.username;
    console.log("LOGGIN OUT " + req.user.username);
    req.logout();
    res.redirect('/');
    req.session.notice = "You have successfully been logged out " + name + "!";
  });


  this.router.get('/forgot-passord', function(req, res, next) {
    res.render('forgot-passord.html', {}, function(err, html) {
      res.render('forgot-passord.html');
    });
  });

  return this.router;
};